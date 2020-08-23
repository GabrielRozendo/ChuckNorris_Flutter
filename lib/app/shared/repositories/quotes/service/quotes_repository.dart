import 'quotes_service.dart';
import '../requests/search/search_request.dart';
import '../requests/categories/categories_response.dart';
import '../requests/search/search_response.dart';
import '../requests/categories/categories_request.dart';
import '../../../../helpers/dependency_assembly.dart';
import '../../../data/models/category.dart';
import '../../../data/viewmodels/past_searches_model.dart';
import '../../../data/models/quote.dart';
import '../../../network/http_session.dart';
import '../../../network/network_mappers.dart';
import '../../../../../constants/app_strings.dart';

class QuotesRepository {
  QuotesRepository._();

  static final _quotesRepository = QuotesRepository._();
  factory QuotesRepository() => _quotesRepository;

  final _session = HttpSession();
  final _pastSearchViewModel = dependencyAssembler<PastSearchesViewModel>();

  Future<List<Category>> getCategories() async {
    final response = await _session.request(
      service: QuotesService(QuotesCategoriesRequest()),
      responseType: QuotesCategoriesResponse(),
    );

    if (response is QuotesCategoriesResponse) return response.categories;
    if (response is ErrorMapable) return Future.error(response.message);
    return Future.error(AppStrings.genericError);
  }

  Future<List<Quote>> search(String value) async {
    final response = await _session.request(
      service: QuotesService(QuotesSearchRequest(value)),
      responseType: QuotesSearchResponse(value),
    );

    if (response is QuotesSearchResponse) {
      _pastSearchViewModel.addItem(response.searchResult);
      return response.searchResult.result;
    }
    if (response is ErrorMapable) return Future.error(response.message);
    return Future.error(AppStrings.genericError);
  }
}
