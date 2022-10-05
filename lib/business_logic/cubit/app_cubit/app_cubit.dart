import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/models/SimilarMovies.dart';
import 'package:movies_app/data/netowrk/movie_api_helper.dart';
import 'package:movies_app/presentation/screen/browse/browse_screen.dart';
import 'package:movies_app/presentation/screen/home/home_screen.dart';
import 'package:movies_app/presentation/screen/search/search_screen.dart';
import 'package:movies_app/presentation/screen/watchlist/watchlist_screen.dart';

import '../../../data/models/Movie.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());

  static AppCubit get(context)=>BlocProvider.of(context);

  int currentIndex = 0;
  bool isConnected = true;
  List<Widget> screens = [HomeScreen(), SearchScreen() , BrowseScreen(), WatchlistScreen()];
  void setBottomNavItem(int index){
    currentIndex = index;
    emit(AppChangeNavItem());
  }
  Movie? detailedMovie;
  List<Movie> similarMovies = [];
  void getTheSimilarMovies(int movieId){
    isConnected = true;
    emit(AppSimilarMoviesLoading());
    try{
      MovieApiHelper.getSimilarMovies(movieId).then((value){
        if(value.statusCode==200){
          print("Similar Success");
          similarMovies = SimilarMovies.fromJson(value.data).results!;
          emit(AppSimilarMoviesSuccess());
        }else{
          print("Similar Error status");
          emit(AppSimilarMoviesError());
        }
      }).catchError((onError){
        print("Similar Error $onError");
          emit(AppSimilarMoviesError());
      });
    }on Exception catch(e){
      print("Similar Error Exception");
      isConnected = false;
      emit(AppSimilarMoviesError());
    }
  }
  void getDetailedMovie(int movieId){
    isConnected = true;
    emit(AppDetailedMovieLoading());
    try{
      MovieApiHelper.getDetailedMovie(movieId).then((value){
        if(value.statusCode==200){
          print("Detailed Success");
          detailedMovie = Movie.fromJson(value.data);
          emit(AppDetailedMovieSuccess());
        }else{
          print("Detailed Error status");
          emit(AppDetailedMovieError());
        }
      }).catchError((onError){
        isConnected = false;
        emit(AppDetailedMovieError());
      });
    }on Exception catch(e){
      isConnected = false;
      print("Detailed Error Exception");
      emit(AppDetailedMovieError());
    }
  }
}