import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/appbar/app_bar.dart';
import 'package:movie_app/domain/tv/entities/tv.dart';
import 'package:movie_app/presentation/watch/widgets/recommendation_tv.dart';
import 'package:movie_app/presentation/watch/widgets/similar_tv.dart';
import 'package:movie_app/presentation/watch/widgets/tv_keywords.dart';
import 'package:movie_app/presentation/watch/widgets/video_overview.dart';
import 'package:movie_app/presentation/watch/widgets/video_player.dart';
import 'package:movie_app/presentation/watch/widgets/video_vote_average.dart';

class TVWatchPage extends StatelessWidget {
  final TVEntity tvEntity;
  const TVWatchPage({required this.tvEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: false,
        title: Text(
          tvEntity.name!,
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
            VideoPlayer(id: tvEntity.id!),
            const SizedBox(height: 16),
            TvKeywords(
              tvId: tvEntity.id!,
            ),
            const SizedBox(height: 16),
            VideoVoteAverage(
              voteAverage: tvEntity.voteAverage!,
            ),
            const SizedBox(height: 16),
            VideoOverview(
              overview: tvEntity.overview!,
            ),
            const SizedBox(height: 16),
            RecommendationTv(
              tvId: tvEntity.id!,
            ),
            const SizedBox(height: 16),
            SimilarTv(
              tvId: tvEntity.id!,
            )
          ],
        ),
      ),
    );
  }
}
