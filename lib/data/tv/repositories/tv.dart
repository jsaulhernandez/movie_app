import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/tv.dart';
import 'package:movie_app/data/tv/models/tv.dart';
import 'package:movie_app/data/tv/sources/tv_api_service.dart';
import 'package:movie_app/domain/tv/repositories/tv.dart';
import 'package:movie_app/service_locator.dart';

class TvRepositoryImpl extends TvRepository {
  @override
  Future<Either> getKeywords(int tvId) {
    // TODO: implement getKeywords
    throw UnimplementedError();
  }

  @override
  Future<Either> getPopularTV() async {
    var popularTv = await sl<TvApiService>().getPopularTV();

    return popularTv.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data["content"])
          .map((m) => TvMapper.toEntity(
                TVModel.fromJson(m),
              ))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getRecommendationTVs(int tvId) {
    // TODO: implement getRecommendationTVs
    throw UnimplementedError();
  }

  @override
  Future<Either> getSimilarTVs(int tvId) {
    // TODO: implement getSimilarTVs
    throw UnimplementedError();
  }

  @override
  Future<Either> searchTV(String query) {
    // TODO: implement searchTV
    throw UnimplementedError();
  }
}
