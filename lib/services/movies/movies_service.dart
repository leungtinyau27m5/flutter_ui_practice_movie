import 'dart:async';
import 'dart:convert';

import 'package:flutter_movie_app/api/api_client.dart';
import 'package:flutter_movie_app/schemas/movie.dart';

const _popularMovies = '''
            [{
              "id":500611,
              "title":"First Movie",
              "banners":["https://placeholder.com/1600x900"]
            },{
              "id":500622,
              "title":"Movie??",
              "banners":["https://placeholder.com/1600x900"]
            }]
''';

class MoviesService extends ApiAgentClient {
  MoviesService({required super.baseUrl, super.headers});

  Future<List<Movie>> getPopularMovies(int categoryId) async {
    return Future.delayed(const Duration(seconds: 1), () {
      final List<dynamic> json = jsonDecode(_popularMovies);
      return json.map((e) => Movie.fromJson(e)).toList();
    });
    // final response = await http.get(parseURL("/movies/$categoryId"), headers: headers);
    // if (isSuccessful(response.statusCode)) {
    //   return jsonDecode(response.body);
    // } else {
    //   throw Exception("Failed to get Movies");
    // }
  }
}
