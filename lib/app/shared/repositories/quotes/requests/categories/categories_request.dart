import '../../service/quotes_endpoints.dart';
import '../../../../network/request_protocol.dart';

class QuotesCategoriesRequest extends RequestProtocol {
  @override
  String get endpoint => QuoteEndpoints.categories;

  @override
  String get mock => throw UnimplementedError();
}
