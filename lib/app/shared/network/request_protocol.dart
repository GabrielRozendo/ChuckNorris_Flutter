import 'http_method.dart';

abstract class RequestProtocol {
  String get endpoint;
  HttpMethod get httpMethod => HttpMethod.GET;
  Map<String, String> get headers => {};
  Map<String, dynamic> get body => {};
}
