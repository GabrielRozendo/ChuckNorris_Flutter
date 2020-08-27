import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart';

import 'http_request_protocol.dart';

/// 'HttpRequest' receives a 'HttpRequestProtocol' object with all the request's information.
class HttpRequest extends Request {
  final HttpRequestProtocol service;

  HttpRequest(this.service)
      : super(
          service.method.value,
          Uri.parse(
              '${service.baseUrl}${service.path}${service.queryParameters}'),
        );

  @override
  Map<String, String> get headers => this.service.headers;

  @override
  String get body => json.encode(this.service.parameters);

  @override
  Uint8List get bodyBytes {
    if (service.parameters == null) return Uint8List(0);

    final encodedBody = Utf8Codec().encode(body);
    return Uint8List.fromList(encodedBody);
  }

  // @override
  // MediaType get _contentType {
  //   var contentType = headers['content-type'];
  //   if (contentType == null) return null;
  //   return new MediaType.parse(contentType);
  // }

  @override
  String toString() {
    return super.toString();
  }
}
