import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:movie_app/presentation/home/bloc/now_playing_state.dart';
import 'package:movie_app/service_locator.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingLoading());

  void getNowPlayingMovies() async {
    var nowPlaying = await sl<GetNowPlayingUseCase>().call();

    nowPlaying.fold((error) {
      emit(FailureLoadNowPlaying(errorMessage: error));
    }, (data) {
      emit(NowPlayingLoaded(nowPlaying: data));
    });
  }
}
