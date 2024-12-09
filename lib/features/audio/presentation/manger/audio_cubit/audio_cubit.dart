import 'package:bloc/bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:dio/dio.dart';
import '../../../../home/data/models/surah_model/surah_model.dart';
import 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final Dio _dio = Dio();
  final String baseUrl = 'https://verse.mp3quran.net/arabic/khalid_alqahtani/64/';

  AudioCubit() : super(AudioState.initial());

  /// Fetch audio files from the API
  Future<void> fetchAudioFiles() async {
    try {
      emit(state.copyWith(isLoading: true));
      final response = await _dio.get(baseUrl);
      final audioFiles = _extractAudioFiles(response.data);
      emit(state.copyWith(audioFiles: audioFiles, isLoading: false));
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Failed to fetch audio files', isLoading: false));
    }
  }

  /// Extract audio file names from the HTML response
  List<String> _extractAudioFiles(String html) {
    final regex = RegExp(r'(\d{6}\.mp3)');
    return regex.allMatches(html).map((e) => e.group(0)!).toList();
  }

  /// Play audio file by URL
  Future<void> playAudio(String fileName) async {
    try {
      final fileUrl = '$baseUrl$fileName';
      await _audioPlayer.setUrl(fileUrl);
      _audioPlayer.play();
      emit(state.copyWith(isPlaying: true));
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Failed to play audio'));
    }
  }

  /// Play all audio files for a Surah sequentially
  Future<void> playSurah(List<String> audioFiles) async {
    try {
      emit(state.copyWith(isPlaying: true));

      // تشغيل كل ملف صوتي بشكل تسلسلي
      for (var audioFile in audioFiles) {
        final fileUrl = '$baseUrl$audioFile';
        await _audioPlayer.setUrl(fileUrl);
        await _audioPlayer.play();

        // الانتظار حتى ينتهي الملف الصوتي
        await _audioPlayer.positionStream.first;
      }

      emit(state.copyWith(isPlaying: false)); // بعد الانتهاء من كل الملفات، توقف التشغيل
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Failed to play the entire surah'));
    }
  }

  void pauseAudio() {
    _audioPlayer.pause();
    emit(state.copyWith(isPlaying: false));
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
    emit(state.copyWith(position: position));
  }

  void changeSpeed(double speed) {
    _audioPlayer.setSpeed(speed);
    emit(state.copyWith(playbackSpeed: speed));
  }

  void changeVolume(double volume) {
    _audioPlayer.setVolume(volume);
    emit(state.copyWith(volume: volume));
  }

  @override
  Future<void> close() {
    _audioPlayer.dispose();
    return super.close();
  }

  Future<void> fetchAndAssignAudioFiles(List<SuraModel> surahs) async {
    try {
      emit(state.copyWith(isLoading: true));

      // جلب الملفات الصوتية من السيرفر
      final response = await _dio.get(baseUrl);
      final audioFiles = _extractAudioFiles(response.data);

      // ربط الملفات الصوتية بالسور
      assignAudioFilesToSurahs(surahs, audioFiles);

      emit(state.copyWith(audioFiles: audioFiles, isLoading: false));
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Failed to fetch and assign audio files', isLoading: false));
    }
  }

  void assignAudioFilesToSurahs(List<SuraModel> surahs, List<String> audioFiles) {
    final groupedFiles = groupAudioFilesBySura(audioFiles);

    for (SuraModel surah in surahs) {
      if (groupedFiles.containsKey(surah.index)) {
        surah.audioFiles.addAll(groupedFiles[surah.index]!);
      }
    }
  }

  Map<int, List<String>> groupAudioFilesBySura(List<String> audioFiles) {
    final Map<int, List<String>> suraAudioMap = {};

    for (String file in audioFiles) {
      final int suraNumber = int.parse(file.substring(0, 3)); // استخراج رقم السورة
      if (!suraAudioMap.containsKey(suraNumber)) {
        suraAudioMap[suraNumber] = [];
      }
      suraAudioMap[suraNumber]!.add(file);
    }

    return suraAudioMap;
  }
}
