import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_review/core/repo/movie_repo.dart';
import 'package:movie_review/core/util/locator.dart';
import 'package:movie_review/feature/home/viewmodel/home_viewmodel.dart';
import 'package:movie_review/feature/movie_details/viewmodel/movie_detail_viewmodel.dart';
 

// List<SingleChildWidget> appProviders = [
//   ChangeNotifierProvider(
//     create: (context) => MovieViewmodel(),
//   ),

// ];

final homeViewModel = StateNotifierProvider<HomeViewmodel, HomeState>(
    (ref) => HomeViewmodel(serviceLocator<MovieRepo>()));

final movieDetailViewModel =
    StateNotifierProvider<HomeDetailViewmodel, HomeDetailState>(
        (ref) => HomeDetailViewmodel(serviceLocator<MovieRepo>()));
