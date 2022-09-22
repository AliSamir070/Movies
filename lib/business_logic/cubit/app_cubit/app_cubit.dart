import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/screen/browse/browse_screen.dart';
import 'package:movies_app/presentation/screen/home/home_screen.dart';
import 'package:movies_app/presentation/screen/search/search_screen.dart';
import 'package:movies_app/presentation/screen/watchlist/watchlist_screen.dart';

import 'app_states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());

  static AppCubit get(context)=>BlocProvider.of(context);

  int currentIndex = 0;
  bool addedToWatchlist=false;

  List<Widget> screens = [HomeScreen(), SearchScreen() , BrowseScreen(), WatchlistScreen()];
  void setBottomNavItem(int index){
    currentIndex = index;
    emit(AppChangeNavItem());
  }

  void isAddedToWatchlist(){
    addedToWatchlist=!addedToWatchlist;
    emit(AddedMovieToWatchlist());
  }
}