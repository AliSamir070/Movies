import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/screen/browse/browse_screen.dart';
import 'package:movies_app/presentation/screen/home/home_screen.dart';
import 'package:movies_app/presentation/screen/search/search_screen.dart';
import 'package:movies_app/presentation/screen/watchlist/watchlist_screen.dart';
import 'package:movies_app/components/constants/constants.dart';
import '../../../data/netowrk/movie_api_helper.dart';
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

  List<dynamic> Catogerys = [];
  void GetDataBrowse(){
    emit(BrowseLoadingState());
    MovieApiHelper.GetData(
        url: Constants.BrowseCatogry,
        query: {
          'api_key':'e284d31396e18dbdd667e756042bd9be',
          'language':'en-US',
        }
    ).then((value){
      //print(value.data.toString());
      Catogerys = value.data['genres'];
      print(Catogerys[0]['name']);
      emit(GetDataBrowseSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetDataBrowseErrorState(error.toString()));
    });

  }
  List<dynamic> Movies = [];
  void GetDataBrowseMovies(int index){

    emit(BrowseLoadingMoviesState());
    MovieApiHelper.GetData(
        url: Constants.BrowseCatogryMovies,
        query: {
          'api_key':'e284d31396e18dbdd667e756042bd9be',
          'language':'en-US',
          'sort_by':'popularity.desc',
          'include_adult':'false',
          'include_video':'false',
          'page':'1',
          'with_watch_monetization_types':'flatrate',
          'with_genres':'$index'

        }
    ).then((value){
      //print(value.data.toString());
      Movies = value.data['results'];
      print("index cat ${index}");
      print(Movies[0]['title']);
      emit(GetDataBrowseMoviesSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetDataBrowseMoviesErrorState(error.toString()));
    });

  }
  // List<dynamic> MoviesPoster = [];
  // void GetDataBrowseMoviesPoster(){
  //
  //   emit(BrowseLoadingMoviesState());
  //   MovieApiHelper.GetData(
  //       url: Constants.BrowseCatogryMovies,
  //       query: {
  //         'api_key':'e284d31396e18dbdd667e756042bd9be',
  //         'language':'en-US',
  //         'sort_by':'popularity.desc',
  //         'include_adult':'false',
  //         'include_video':'false',
  //         'page':'1',
  //         'with_watch_monetization_types':'flatrate',
  //
  //
  //       }
  //   ).then((value){
  //     //print(value.data.toString());
  //     Movies = value.data['results'];
  //     print(Movies[0]['title']);
  //     emit(GetDataBrowseMoviesSuccessState());
  //   }).catchError((error){
  //     print(error.toString());
  //     emit(GetDataBrowseMoviesErrorState(error.toString()));
  //   });
  //
  // }

  void isAddedToWatchlist(){
    addedToWatchlist=!addedToWatchlist;
    emit(AddedMovieToWatchlist());
  }
}