class ApiRoutes {
  static getPopularMovie({required String id}) =>
      "/3/movie/popular?language=en-US&page=1";
  static getMovieDetail({required int id}) => "/3/movie/$id?language=en-US";
  static getHighestRatedMovie({required int page}) =>
      "/3/movie/top_rated?language=en-US&page=$page";
}
// https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1
