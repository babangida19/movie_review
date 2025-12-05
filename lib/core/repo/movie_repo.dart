import 'package:movie_review/core/model/movie_detail.dart';
import 'package:movie_review/core/model/popular_movie_model.dart';
import 'package:movie_review/core/networking_service/api_routes.dart';
import 'package:movie_review/core/networking_service/network_service.dart';
import 'package:movie_review/core/util/locator.dart';
abstract class MovieRepo {
  Future<PopularMovieModel> getPopularMovie({int page = 1});
  Future<MovieDetailsModel> getMovieDetail({required int movieId});
  Future<PopularMovieModel> getHighestRatedMovie({required int page});
}

class MovieRepoImpl extends MovieRepo {
  final NetworkService _networkService = serviceLocator<NetworkService>();

  @override
  Future<PopularMovieModel> getPopularMovie({int page = 1}) async {
    final response = await _networkService.getData(
      url: ApiRoutes.getPopularMovie(page: page),
    );
    return PopularMovieModel.fromJson(response);
  }

  @override
  Future<MovieDetailsModel> getMovieDetail({required int movieId}) async {
    final response = await _networkService.getData(
        url: ApiRoutes.getMovieDetail(id: movieId));
    return MovieDetailsModel.fromJson(response);
  }

  @override
  Future<PopularMovieModel> getHighestRatedMovie({required int page}) async {
    final response = await _networkService.getData(
        url: ApiRoutes.getHighestRatedMovie(page: page));
    return PopularMovieModel.fromJson(response);
  }
}