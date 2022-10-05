abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeNavItem extends AppStates {}

class AddedMovieToWatchlist extends AppStates {}

class LoadingLatestMovie extends AppStates {}

class SucceededLoadingLatestMovie extends AppStates {}

class ErrorLoadingLatestMovie extends AppStates {
  String error;

  ErrorLoadingLatestMovie(this.error);
}

class LoadingPopularMovie extends AppStates {}

class SucceededLoadingPopularMovie extends AppStates {}

class ErrorLoadingPopularMovie extends AppStates {
  String error;

  ErrorLoadingPopularMovie(this.error);
}

class LoadingRecommendedMovie extends AppStates {}

class SucceededLoadingRecommendedMovie extends AppStates {}

class ErrorLoadingRecommendedMovie extends AppStates {
  String error;

  ErrorLoadingRecommendedMovie(this.error);
}
