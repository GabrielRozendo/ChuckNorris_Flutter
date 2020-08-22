import '../../service/quotes_endpoints.dart';
import '../../../../network/request_protocol.dart';

class QuotesSearchRequest extends RequestProtocol {
  final String term;
  QuotesSearchRequest(this.term);

  @override
  String get endpoint => QuoteEndpoints.search(term);

  @override
  String get mock => throw UnimplementedError();
}
