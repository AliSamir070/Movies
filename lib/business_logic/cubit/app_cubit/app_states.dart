abstract class AppStates{}
class AppInitialState extends AppStates{}
class AppChangeNavItem extends AppStates{}
class AddedMovieToWatchlist extends AppStates{}
class BrowseLoadingState extends AppStates{}
class GetDataBrowseSuccessState extends AppStates{}
class GetDataBrowseErrorState extends AppStates{
  final String error;

  GetDataBrowseErrorState(this.error);

}
class BrowseLoadingMoviesState extends AppStates{}
class GetDataBrowseMoviesSuccessState extends AppStates{}
class GetDataBrowseMoviesErrorState extends AppStates{
  final String error;

  GetDataBrowseMoviesErrorState(this.error);

}

