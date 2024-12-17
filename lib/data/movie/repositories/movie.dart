import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/movie.dart';
import 'package:movie_app/common/helper/mapper/trailer.dart';
import 'package:movie_app/core/models/trailer.dart';
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

  @override
  Future<Either> getMovieTrailer(int movieId) async {
    var getTrailer = await sl<MovieApiService>().getMovieTrailer(movieId);

    return getTrailer.fold((error) {
      return Left(error);
    }, (data) {
      if (data['trailer'] == null || data['trailer'].isEmpty) {
        return const Left("No trailer available for this movie.");
      }

      var trailer =
          TrailerMapper.toEntity(TrailerModel.fromJson(data['trailer']));
      return Right(trailer);
    });
  }

  @override
  Future<Either> getRecommendationMovies(int movieId) async {
    var returnedData =
        await sl<MovieApiService>().getRecommendationMovies(movieId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getSimilarMovies(int movieId) async {
    var returnedData = await sl<MovieApiService>().getSimilarMovies(movieId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }
}
