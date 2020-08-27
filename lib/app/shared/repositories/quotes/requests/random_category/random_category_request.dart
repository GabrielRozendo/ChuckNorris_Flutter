import '../../service/quotes_endpoints.dart';
import '../../../../data/models/category.dart';
import '../../../../network/request_protocol.dart';

class QuotesRandomCategoryRequest extends RequestProtocol {
  final Category category;
  QuotesRandomCategoryRequest(this.category);

  @override
  String get endpoint => QuotesEndpoints.randomCategory(category.name);
}
