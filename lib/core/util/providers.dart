
import 'package:movie_review/feature/home/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';



List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider(
    create: (context) => MovieViewmodel(),
  ),

];
