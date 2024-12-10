import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/movie/movie_card.dart';
import 'package:movie_app/presentation/home/bloc/now_playing_cubit.dart';
import 'package:movie_app/presentation/home/bloc/now_playing_state.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NowPlayingCubit()..getNowPlayingMovies(),
      child: BlocBuilder<NowPlayingCubit, NowPlayingState>(
        builder: (context, state) {
          if (state is NowPlayingLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is NowPlayingLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return MovieCard(
                    movieEntity: state.nowPlaying[index],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
                itemCount: state.nowPlaying.length,
              ),
            );
          }

          if (state is FailureLoadNowPlaying) {
            return Center(child: Text(state.errorMessage));
          }

          return Container();
        },
      ),
    );
  }
}
