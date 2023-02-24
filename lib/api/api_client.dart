import 'dart:io';
import 'package:flutter_movie_app/api/api_request.dart';
import 'package:flutter_movie_app/api/api_response.dart';
import 'package:http/http.dart' as http;

const _defaultHeaders = {
  HttpHeaders.contentTypeHeader: "application/json"
};

class ApiAgentClient implements ApiRequest, ApiResponse {
  ApiAgentClient({
    required this.baseUrl,
    this.headers = _defaultHeaders,
  });

  final String baseUrl;
  final Map<String, String>? headers;

  @override
  bool isSuccessful(int statusCode) => statusCode >= 200 && statusCode < 300;

  @override
  Uri parseURL(String uri) => Uri.parse(uri);
}
