import '../../service/quotes_endpoints.dart';
import '../../../../network/request_protocol.dart';

class QuotesRandomRequest extends RequestProtocol {
  @override
  String get endpoint => QuoteEndpoints.random;

  @override
  String get mock => throw UnimplementedError();
}
