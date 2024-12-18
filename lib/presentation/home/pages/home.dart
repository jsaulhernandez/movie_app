import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/common/bloc/generic_data_cubit.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/common/widgets/appbar/app_bar.dart';
import 'package:movie_app/core/configs/assets/app_vectors.dart';
import 'package:movie_app/domain/movie/entities/movie.dart';
import 'package:movie_app/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:movie_app/domain/movie/usecases/get_trending_movies.dart';
import 'package:movie_app/domain/tv/entities/tv.dart';
import 'package:movie_app/domain/tv/usecases/get_popular_tv.dart';
import 'package:movie_app/presentation/home/widgets/category_text.dart';
import 'package:movie_app/presentation/home/widgets/now_playing_movies.dart';
import 'package:movie_app/presentation/home/widgets/popular_tv.dart';
import 'package:movie_app/presentation/home/widgets/trending_movies.dart';
import 'package:movie_app/presentation/search/pages/search.dart';
import 'package:movie_app/service_locator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        action: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            AppNavigator.push(context, const SearchPage());
          },
        ),
        title: SvgPicture.asset(AppVectors.logo),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context
              .read<GenericDataCubit>()
              .getData<List<MovieEntity>>(sl<GetTrendingMoviesUseCase>());
          context
              .read<GenericDataCubit>()
              .getData<List<MovieEntity>>(sl<GetNowPlayingUseCase>());
          context
              .read<GenericDataCubit>()
              .getData<List<TVEntity>>(sl<GetPopularTvUseCase>());
        },
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryText(title: 'Trending 🔥'),
              TrendingMovies(),
              SizedBox(
                height: 16,
              ),
              CategoryText(title: 'Now Playing'),
              SizedBox(
                height: 16,
              ),
              NowPlayingMovies(),
              SizedBox(
                height: 16,
              ),
              CategoryText(title: 'Popular TV'),
              SizedBox(
                height: 16,
              ),
              PopularTv(),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
