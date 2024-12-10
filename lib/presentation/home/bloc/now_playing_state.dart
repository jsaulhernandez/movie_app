import 'package:movie_app/domain/movie/entities/movie.dart';

abstract class NowPlayingState {}

class NowPlayingLoading extends NowPlayingState {}

class NowPlayingLoaded extends NowPlayingState {
  final List<MovieEntity> nowPlaying;
  NowPlayingLoaded({required this.nowPlaying});
}

class FailureLoadNowPlaying extends NowPlayingState {
  final String errorMessage;
  FailureLoadNowPlaying({required this.errorMessage});
}
