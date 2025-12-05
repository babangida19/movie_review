class ApiRoutes {
  static String getPopularMovie({int page = 1}) => '/3/movie/popular?page=$page';
  static String getMovieDetail({required int id}) => '/3/movie/$id';
  static String getHighestRatedMovie({int page = 1}) => '/3/movie/top_rated?page=$page';
}