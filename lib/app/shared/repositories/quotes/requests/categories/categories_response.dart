import '../../../../data/models/category.dart';
import '../../../../network/network_mappers.dart';

class QuotesCategoriesResponse extends ListMapable {
  List<Category> categories;

  @override
  Mapable fromJsonList(List json) {
    categories = json.map((e) => Category(name: e)).toList();
    return this;
  }
}
