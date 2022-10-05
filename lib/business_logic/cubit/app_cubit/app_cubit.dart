import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/components/constants/constants.dart';
import 'package:movies_app/data/netowrk/movie_api_helper.dart';
import 'package:movies_app/presentation/screen/browse/browse_screen.dart';
import 'package:movies_app/presentation/screen/home/home_screen.dart';
import 'package:movies_app/presentation/screen/search/search_screen.dart';
import 'package:movies_app/presentation/screen/watchlist/watchlist_screen.dart';

import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  bool addedToWatchlist = false;
  var latestMovie;
  List popularMovie = [];
  List recommendedMovie = [];

  List<Widget> screens = const [
    HomeScreen(),
    SearchScreen(),
    BrowseScreen(),
    WatchlistScreen()
  ];
  void setBottomNavItem(int index) {
    currentIndex = index;
    emit(AppChangeNavItem());
  }

  void isAddedToWatchlist() {
    addedToWatchlist = !addedToWatchlist;
    emit(AddedMovieToWatchlist());
  }

  void getLatest() {
    emit(LoadingLatestMovie());
    MovieApiHelper.fetchMovie(url: Constants.latestMethodUrl, query: {
      "api_key": Constants.apiKey,
    }).then((value) {
      latestMovie = value.data;
      emit(SucceededLoadingLatestMovie());
    }).catchError(((e) {
      print(e.toString());
      emit(ErrorLoadingLatestMovie(e));
    }));
  }

  void getPopular() {
    emit(LoadingPopularMovie());
    if (popularMovie.isEmpty) {
      MovieApiHelper.fetchMovie(url: Constants.newReleasesMethodUrl, query: {
        "api_key": Constants.apiKey,
      }).then((value) {
        popularMovie = value.data["results"];
        emit(SucceededLoadingPopularMovie());
      }).catchError(((e) {
        print(e.toString());
        emit(ErrorLoadingPopularMovie(e));
      }));
    }
  }

  void getRecommended() {
    emit(LoadingRecommendedMovie());
    if (recommendedMovie.isEmpty) {
      MovieApiHelper.fetchMovie(url: Constants.recommendedMethodUrl, query: {
        "api_key": Constants.apiKey,
      }).then((value) {
        recommendedMovie = value.data["results"];
        emit(SucceededLoadingRecommendedMovie());
      }).catchError(((e) {
        print(e.toString());
        emit(ErrorLoadingRecommendedMovie(e));
      }));
    }
  }
}
