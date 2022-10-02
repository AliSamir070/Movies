class Constants{
  static String BaseUrl = "https://api.themoviedb.org/";
  static String searchMethodUrl = "3/search/movie";
  static String imageUrl = "https://image.tmdb.org/t/p/original/";
  static String ApiKeyBebe = "e284d31396e18dbdd667e756042bd9be";
  static String aliApiKey = "47370569654ee7b6d8f76378322b155b";
  static String BrowseCatogry = "3/genre/movie/list";
  static String BrowseCatogryMovies = "3/discover/movie";
  static String getDetailsMethodUrl(String movieid){
    return "3/movie/${movieid}";
  }

}