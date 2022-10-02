
import 'package:flutter/material.dart';
import 'package:movies_app/data/netowrk/movie_api_helper.dart';
import 'package:movies_app/presentation/layout/app_layout.dart';
import 'package:movies_app/presentation/screen/browseMovies/browseMovies.dart';
import 'package:movies_app/presentation/screen/details/details_screen.dart';
import 'package:movies_app/style/theme/theme_app.dart';

void main() {
  MovieApiHelper.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppStyle.lightTheme,
      routes: {
        AppLayout.route:(_)=>AppLayout(),
        DetailsScreen.route:(_)=>DetailsScreen(),
        BrowseMoviesScreen.routeName : (_)=>BrowseMoviesScreen(),
      },
      initialRoute: AppLayout.route,
    );
  }
}
