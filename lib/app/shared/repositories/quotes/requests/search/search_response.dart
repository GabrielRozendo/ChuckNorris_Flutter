import '../../../../data/models/category.dart';
import '../../../../network/network_mappers.dart';

class QuotesCategoriesResponse extends ListMapable {
  List<Category> categories;

  @override
  Mapable fromJsonList(List json) {
    if (json.isNotEmpty) categories = json;
    return this;
  }
}
