import 'package:dio/dio.dart';
import 'package:movie_showcase/models/movie_response.dart';

class MovieApiProvider {
  final String _endpoint = 'https://filmespy.herokuapp.com/api/v1/filmes';
  final Dio _dio = Dio();

  Future<MovieResponse> getMovies() async {
    Response response;
    try {
      response = await _dio.get(_endpoint).timeout(
            Duration(seconds: 1),
            onTimeout: () => null,
          );
      if (response != null) {
        return MovieResponse.fromJson(response.data);
      }
      return MovieResponse(filmes: []);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse(filmes: []);
    }
  }
}
