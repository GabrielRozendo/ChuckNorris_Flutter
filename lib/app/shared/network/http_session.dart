import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'error_response.dart';
import 'http_request.dart';
import 'http_request_protocol.dart';
import 'network_mappers.dart';
import '../../helpers/extensions/response_extension.dart';

/// 'HttpSessionProtocol' acts as provider to send requests to the Network.
abstract class HttpSessionProtocol {
  Future<Mapable> request({HttpRequestProtocol service, Mapable responseType});
}

class HttpSession implements HttpSessionProtocol {
  //Creating Singleton
  HttpSession._privateConstructor() {
    _client = Client();
  }
  static final HttpSession _apiRequests = HttpSession._privateConstructor();
  factory HttpSession() => _apiRequests;

  Client _client;

  @override
  Future<Mapable> request({
    HttpRequestProtocol service,
    Mapable responseType,
  }) async {
    try {
      final stopwatch = Stopwatch()..start();

      final request = HttpRequest(service);
      request.persistentConnection = false;
      debugPrint(request.toString());

      final streamedResponse = await _client.send(request);
      final response = await Response.fromStream(streamedResponse);
      stopwatch.stop();
      debugPrint(response.description(stopwatch.elapsed));
      if (response.statusCode >= 200 && response.statusCode <= 299)
        return Mapable(responseType, response.body);

      final errorResponse = ErrorResponse().fromJson(
        json.decode(response.body),
      );
      errorResponse.response = response;
      return errorResponse;
    } catch (exception) {
      debugPrint(exception);
      return ErrorResponse().genericError(message: exception.toString());
    }
  }
}
