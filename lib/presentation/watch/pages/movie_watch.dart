import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/appbar/app_bar.dart';
import 'package:movie_app/domain/movie/entities/movie.dart';
import 'package:movie_app/presentation/watch/widgets/recommendation_movies.dart';
import 'package:movie_app/presentation/watch/widgets/similar_movies.dart';
import 'package:movie_app/presentation/watch/widgets/video_overview.dart';
import 'package:movie_app/presentation/watch/widgets/video_player.dart';
import 'package:movie_app/presentation/watch/widgets/video_release_date.dart';
import 'package:movie_app/presentation/watch/widgets/video_vote_average.dart';

class MovieWatchPage extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieWatchPage({required this.movieEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: false,
        title: Text(
          movieEntity.title!,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(id: movieEntity.id!),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoReleaseDate(
                  releaseDate: movieEntity.releaseDate!,
                ),
                VideoVoteAverage(
                  voteAverage: movieEntity.voteAverage!,
                )
              ],
            ),
            const SizedBox(height: 16),
            VideoOverview(
              overview: movieEntity.overview!,
            ),
            const SizedBox(
              height: 16,
            ),
            RecommendationMovies(
              movieId: movieEntity.id!,
            ),
            const SizedBox(
              height: 16,
            ),
            SimilarMovies(
              movieId: movieEntity.id!,
            )
          ],
        ),
      ),
    );
  }
}
