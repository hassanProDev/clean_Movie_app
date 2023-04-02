class ApiConstance{
  static const String apiKey="c3435cfe40aeb079689227d82bf921d3";
  static const String baseUrl="https://api.themoviedb.org/3";
  static const String nowPlayingPath="$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String popularMoviePath="$baseUrl/movie/popular?api_key=$apiKey";
  static const String topRatedMoviePath="$baseUrl/movie/top_rated?api_key=$apiKey";
  static String movieDetailsPath(int id)=>"$baseUrl/movie/$id?api_key=$apiKey";
  static String recommendedMoviePath(int id)=>"$baseUrl/movie/$id/recommendations?api_key=$apiKey";
  static const String imageBaseUrl="https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path)=>"$imageBaseUrl$path";
}

// https://api.themoviedb.org/3/movie/980078/RecommendedMovies?api_key=c3435cfe40aeb079689227d82bf921d3