import 'quotes_endpoints.dart';
import '../../../network/http_method.dart';
import '../../../network/http_request_protocol.dart';
import '../../../network/request_protocol.dart';

class QuotesService extends HttpRequestProtocol {
  final RequestProtocol request;
  QuotesService(this.request);

  @override
  String get baseUrl => QuotesEndpoints.baseUrl;

  @override
  Map<String, String> get headers => {
        'content-type': 'application/x-www-form-urlencoded',
        'accept': 'application/json',
      }..addAll(request.headers);

  @override
  HttpMethod get method => request.httpMethod;

  @override
  Map<String, dynamic> get parameters => request.body;

  @override
  String get path => request.endpoint;

  @override
  String get mockAssetName => request.mock;
}
