import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'quran_player_state.dart';

class QuranPlayerCubit extends Cubit<QuranPlayerState> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  String _track = '';

  QuranPlayerCubit() : super(QuranPlayerInitial()) {
    // الاستماع لحدث الانتهاء
    _audioPlayer.onPlayerComplete.listen((event) {
      _isPlaying = false;
      emit(QuranPlayerStopped());
    });
  }

  bool get isPlaying => _isPlaying;
  String get track => _track;

  void updateTrack(String track) {
    _track = track;
    emit(QuranPlayerTrackUpdated(_track));
  }

  void togglePlayPause() {
    if (_isPlaying) {
      _audioPlayer.pause();
      _isPlaying = false;
      emit(QuranPlayerPaused());
    } else {
      _audioPlayer.play(UrlSource(_track));
      _isPlaying = true;
      emit(QuranPlayerPlaying());
    }
  }
}
