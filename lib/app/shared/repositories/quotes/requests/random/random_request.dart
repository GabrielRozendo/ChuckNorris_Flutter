import '../../service/quotes_endpoints.dart';
import '../../../../network/request_protocol.dart';

class QuotesRandomRequest extends RequestProtocol {
  @override
  String get endpoint => QuotesEndpoints.random;

  @override
  String get mock => throw UnimplementedError();
}
