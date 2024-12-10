import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/movie.dart';
import 'package:movie_app/data/movie/models/movie.dart';
import 'package:movie_app/data/movie/sources/movie_api_service.dart';
import 'package:movie_app/domain/movie/repositories/movie.dart';
import 'package:movie_app/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var trendingMovies = await sl<MovieApiService>().getTrendingMovies();

    return trendingMovies.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data["content"])
          .map((m) => MovieMapper.toEntity(MovieModel.fromJson(m)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    var getNowPlayingMovies = await sl<MovieApiService>().getNowPlayingMovies();

    return getNowPlayingMovies.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data["content"])
          .map((m) => MovieMapper.toEntity(MovieModel.fromJson(m)))
          .toList();
      return Right(movies);
    });
  }
}
