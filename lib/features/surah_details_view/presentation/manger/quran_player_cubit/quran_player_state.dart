part of 'quran_player_cubit.dart';

abstract class QuranPlayerState {}

class QuranPlayerInitial extends QuranPlayerState {}

class QuranPlayerPlaying extends QuranPlayerState {}

class QuranPlayerPaused extends QuranPlayerState {}

class QuranPlayerStopped extends QuranPlayerState {}

class QuranPlayerTrackUpdated extends QuranPlayerState {
  final String newTrackUrl;

  QuranPlayerTrackUpdated(this.newTrackUrl);
}
