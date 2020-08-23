import '../../service/quotes_endpoints.dart';
import '../../../../network/request_protocol.dart';

class QuotesCategoriesRequest extends RequestProtocol {
  @override
  String get endpoint => QuotesEndpoints.categories;
}
