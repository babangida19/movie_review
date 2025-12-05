import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_review/core/model/movie_detail.dart';
import 'package:movie_review/core/repo/movie_repo.dart';

class HomeDetailViewmodel extends StateNotifier<HomeDetailState> {
  final MovieRepo _movieRepo;
  HomeDetailViewmodel(this._movieRepo) : super(HomeDetailState.initial());

  Future<MovieDetailsModel> getMovieDetail(int movieId) async {
    try {
      final response = await _movieRepo.getMovieDetail(movieId: movieId);
      state = state.copyWith(movieDetail: AsyncValue.data(response));
      return response;
    } catch (e, s) {
      state = state.copyWith(
        movieDetail: AsyncError(e, s),
      );
      rethrow;
    }
  }
}

class HomeDetailState {
  final AsyncValue<MovieDetailsModel> movieDetail;
  HomeDetailState({required this.movieDetail});

  HomeDetailState.initial() : movieDetail = const AsyncValue.loading();

  HomeDetailState copyWith({
    AsyncValue<MovieDetailsModel>? movieDetail,
  }) {
    return HomeDetailState(movieDetail: movieDetail ?? this.movieDetail);
  }
}
