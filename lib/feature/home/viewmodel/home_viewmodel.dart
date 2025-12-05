import 'package:movie_review/core/model/popular_movie_model.dart';
import 'package:movie_review/core/repo/movie_repo.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeViewmodel extends StateNotifier<HomeState> {
  final MovieRepo _movieRepo;
  late final PagingController<int, Result> popularPagingController;

  HomeViewmodel(MovieRepo movieRepo)
      : _movieRepo = movieRepo,
        super(HomeState.initial()) {
    popularPagingController = PagingController<int, Result>(
      getNextPageKey: (state) {
        if (!state.hasNextPage) return null;
        final lastKey = state.keys?.last ?? 0;
        return lastKey + 1;
      },
      fetchPage: _fetchPopularMovies,
    );

    getHighestRatedMovie();
  }

  Future<List<Result>> _fetchPopularMovies(int pageKey) async {
    try {
      final response = await _movieRepo.getPopularMovie(page: pageKey);

      state = state.copyWith(
        popularMovies: AsyncValue.data(response),
      );

      return response.results ?? [];
    } catch (e, s) {
      state = state.copyWith(
        popularMovies: AsyncValue.error(e, s),
      );
      rethrow;
    }
  }

  Future<void> getHighestRatedMovie() async {
    state = state.copyWith(
      highestRatedMovies: AsyncValue.loading(),
    );

    try {
      var response = await _movieRepo.getHighestRatedMovie(page: 1);
      state = state.copyWith(
        highestRatedMovies: AsyncValue.data(response),
      );
    } catch (e, s) {
      state = state.copyWith(
        highestRatedMovies: AsyncValue.error(e, s),
      );
    }
  }

  @override
  void dispose() {
    popularPagingController.dispose();
    super.dispose();
  }
}

class HomeState {
  final AsyncValue<PopularMovieModel> popularMovies;
  final AsyncValue<PopularMovieModel> highestRatedMovies;

  HomeState({required this.popularMovies, required this.highestRatedMovies});

  HomeState.initial()
      : popularMovies = const AsyncValue.loading(),
        highestRatedMovies = const AsyncValue.loading();

  HomeState copyWith({
    AsyncValue<PopularMovieModel>? popularMovies,
    AsyncValue<PopularMovieModel>? highestRatedMovies,
  }) {
    return HomeState(
      popularMovies: popularMovies ?? this.popularMovies,
      highestRatedMovies: highestRatedMovies ?? this.highestRatedMovies,
    );
  }
}
