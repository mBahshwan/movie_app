import 'dart:convert';

import 'package:movie_app/constants/consts.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:http/http.dart' as http;

class Functions {
  // ignore: body_might_complete_normally_nullable
  Future<List<Movie>?> getPopularMovies() async {
    final respose = await http.get(Uri.parse(Const.popularLink));
    final body = json.decode(respose.body)['results'] as List;
    if (respose.statusCode == 200) {
      return body.map((e) => Movie.fromJson(e)).toList();
    }
  }

  // ignore: body_might_complete_normally_nullable
  Future<List<Movie>?> getTopRatedMovies() async {
    final respose = await http.get(Uri.parse(Const.topRatedLink));
    final body = json.decode(respose.body)['results'] as List;
    if (respose.statusCode == 200) {
      return body.map((e) => Movie.fromJson(e)).toList();
    }
  }

  // ignore: body_might_complete_normally_nullable
  Future<List<Movie>?> getUpcomingMovies() async {
    final respose = await http.get(Uri.parse(Const.upcomingLink));
    final body = json.decode(respose.body)['results'] as List;
    if (respose.statusCode == 200) {
      return body.map((e) => Movie.fromJson(e)).toList();
    }
  }
}
