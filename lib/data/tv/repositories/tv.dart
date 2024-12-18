import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/keyword.dart';
import 'package:movie_app/common/helper/mapper/tv.dart';
import 'package:movie_app/core/models/keyword.dart';
import 'package:movie_app/data/tv/models/tv.dart';
import 'package:movie_app/data/tv/sources/tv_api_service.dart';
import 'package:movie_app/domain/tv/repositories/tv.dart';
import 'package:movie_app/service_locator.dart';

class TvRepositoryImpl extends TvRepository {
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
  Future<Either> getRecommendationTVs(int tvId) async {
    var recommendations = await sl<TvApiService>().getRecommendationTVs(tvId);

    return recommendations.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getSimilarTVs(int tvId) async {
    var similar = await sl<TvApiService>().getSimilarTVs(tvId);

    return similar.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getKeywords(int tvId) async {
    var returnedData = await sl<TvApiService>().getKeywords(tvId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => KeywordMapper.toEntity(KeywordModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> searchTV(String query) async {
    var result = await sl<TvApiService>().searchTV(query);

    return result.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }
}
