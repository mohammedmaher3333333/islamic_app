class AudioState {
  final Duration position;
  final Duration duration;
  final bool isPlaying;
  final double playbackSpeed;
  final double volume;
  final List<String> audioFiles; // قائمة الملفات الصوتية
  final String? errorMessage; // الرسالة الخطأ إن وجدت
  final bool isLoading; // حالة التحميل

  AudioState({
    required this.position,
    required this.duration,
    required this.isPlaying,
    required this.playbackSpeed,
    required this.volume,
    required this.audioFiles,
    required this.errorMessage,
    required this.isLoading,
  });

  factory AudioState.initial() {
    return AudioState(
      position: Duration.zero,
      duration: Duration.zero,
      isPlaying: false,
      playbackSpeed: 1.0,
      volume: 1.0,
      audioFiles: [],
      errorMessage: null,
      isLoading: false,
    );
  }

  AudioState copyWith({
    Duration? position,
    Duration? duration,
    bool? isPlaying,
    double? playbackSpeed,
    double? volume,
    List<String>? audioFiles,
    String? errorMessage,
    bool? isLoading,
  }) {
    return AudioState(
      position: position ?? this.position,
      duration: duration ?? this.duration,
      isPlaying: isPlaying ?? this.isPlaying,
      playbackSpeed: playbackSpeed ?? this.playbackSpeed,
      volume: volume ?? this.volume,
      audioFiles: audioFiles ?? this.audioFiles,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
