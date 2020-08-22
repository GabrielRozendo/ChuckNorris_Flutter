import '../../../../data/models/quote.dart';
import '../../../../network/network_mappers.dart';

class QuotesRandomResponse extends BaseMapable {
  Quote quote;

  @override
  Mapable fromJson(Map<String, dynamic> json) {
    if (json != null) quote = Quote.fromJson(json);
    return this;
  }
}
