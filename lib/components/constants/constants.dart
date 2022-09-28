class Constants{
  static String BaseUrl = "https://api.themoviedb.org/";
  static String searchMethodUrl = "3/search/movie";
  static String imageUrl = "https://image.tmdb.org/t/p/original";
  static String aliApiKey = "47370569654ee7b6d8f76378322b155b";
  static String getDetailsMethodUrl(String movieid){
    return "3/movie/${movieid}";
  }
  // ToDo The methods urls of api functions
}