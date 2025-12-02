import 'package:flutter/material.dart';
import 'package:movie_review/core/model/movie_detail.dart';
import 'package:movie_review/core/model/popular_movie_model.dart';
import 'package:movie_review/core/networking_service/data_response.dart';
import 'package:movie_review/core/repo/movie_repo.dart';
import 'package:movie_review/core/util/locator.dart';

class MovieViewmodel extends ChangeNotifier {
  final _movieRepo = serviceLocator<MovieRepo>();

  NetworkDataResponse<PopularMovieModel> _popularMovieResponse =
      NetworkDataResponse.idle();

  NetworkDataResponse<PopularMovieModel> get popularMovieResponse =>
      _popularMovieResponse;

  set popularMovieResponse(NetworkDataResponse<PopularMovieModel> value) {
    _popularMovieResponse = value;
    notifyListeners();
  }

  getPopularMovie() async {
    popularMovieResponse = NetworkDataResponse.loading("");

    try {
      var response = await _movieRepo.getPopularMovie();
      popularMovieResponse = NetworkDataResponse.completed(response);
    } catch (e) {
      popularMovieResponse = NetworkDataResponse.error(e.toString());
    }
  }

  NetworkDataResponse<MovieDetailsModel> _movieDetailResponse =
      NetworkDataResponse.idle();

  NetworkDataResponse<MovieDetailsModel> get movieDetailResponse =>
      _movieDetailResponse;

  set movieDetailResponse(NetworkDataResponse<MovieDetailsModel> value) {
    _movieDetailResponse = value;
    notifyListeners();
  }

  getMovieDetails(int movieId) async {
    movieDetailResponse = NetworkDataResponse.loading("");

    try {
      var response = await _movieRepo.getMovieDetail(movieId: movieId);
      movieDetailResponse = NetworkDataResponse.completed(response);
    } catch (e) {
      movieDetailResponse = NetworkDataResponse.error(e.toString());
    }
  }

  NetworkDataResponse<PopularMovieModel> _highestRatedMovieResponse =
      NetworkDataResponse.idle();

  NetworkDataResponse<PopularMovieModel> get highestRatedMovieResponse =>
      _highestRatedMovieResponse;

  set highestRatedMovieResponse(NetworkDataResponse<PopularMovieModel> value) {
    _highestRatedMovieResponse = value;
    notifyListeners();
  }
  getHighestRatedMovie(int movieId) async {
    highestRatedMovieResponse = NetworkDataResponse.loading("");

    try {
      var response =
          await _movieRepo.getHighestRatedMovie(movieId: movieId);
      highestRatedMovieResponse = NetworkDataResponse.completed(response);
    } catch (e) {
      highestRatedMovieResponse = NetworkDataResponse.error(e.toString());
    }
  }
}
