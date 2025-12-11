import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_review/core/theme/app_color.dart';
import 'package:movie_review/core/util/locator.dart';
import 'package:movie_review/main_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await locatorSetUp();
  await dotenv.load(fileName: ".env");
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
              title: 'Movie App',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                  fontFamily: GoogleFonts.mulish().fontFamily,
                  scaffoldBackgroundColor: AppColor.white),
              home: MainView());
        });
  }
}
