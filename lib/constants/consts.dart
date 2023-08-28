class Const {
  // ignore: non_constant_identifier_names
  static String api_key = "API KEY HERE";
  static String popularLink =
      "https://api.themoviedb.org/3/movie/popular?api_key=$api_key";
  static String topRatedLink =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=$api_key";
  static String upcomingLink =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=$api_key";
  static String imagePath = "https://image.tmdb.org/t/p/w500";
}
