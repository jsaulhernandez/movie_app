import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class TrailerState {}

class TrailerLoading extends TrailerState {}

class TrailerLoaded extends TrailerState {
  final YoutubePlayerController youtubePlayerController;
  TrailerLoaded({required this.youtubePlayerController});
}

class FailureLoadTrailer extends TrailerState {
  final String errorMessage;
  FailureLoadTrailer({required this.errorMessage});
}
