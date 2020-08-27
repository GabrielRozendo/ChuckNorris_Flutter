import 'service/quotes_service.dart';
import 'requests/random/random_request.dart';
import 'requests/random/random_response.dart';
import 'requests/random_category/random_category_request.dart';
import 'requests/random_category/random_category_response.dart';
import 'requests/search/search_request.dart';
import 'requests/categories/categories_response.dart';
import 'requests/search/search_response.dart';
import 'requests/categories/categories_request.dart';
import '../../data/models/category.dart';
import '../../data/viewmodels/past_searches_model.dart';
import '../../data/viewmodels/categories_model..dart';
import '../../data/models/quote.dart';
import '../../network/http_session.dart';
import '../../network/network_mappers.dart';
import '../../../helpers/dependency_assembly.dart';
import '../../../../constants/app_strings.dart';

class QuotesRepository {
  final _session = dependencyAssembler<HttpSession>();
  final _pastSearchViewModel = dependencyAssembler<PastSearchesViewModel>();
  final _categoriesViewModel = dependencyAssembler<CategoriesViewModel>();

  List<Category> getCategories() {
    return _categoriesViewModel.categories;
  }

  Future<List<Category>> fetchCategories() async {
    final response = await _session.request(
      service: QuotesService(QuotesCategoriesRequest()),
      responseType: QuotesCategoriesResponse(),
    );

    if (response is QuotesCategoriesResponse) return response.categories;
    if (response is ErrorMapable) return Future.error(response.message);
    return Future.error(AppStrings.genericError);
  }

  Future<Quote> random() async {
    final response = await _session.request(
      service: QuotesService(QuotesRandomRequest()),
      responseType: QuotesRandomResponse(),
    );

    if (response is QuotesRandomResponse) {
      return response.quote;
    }
    if (response is ErrorMapable) return Future.error(response.message);
    return Future.error(AppStrings.genericError);
  }

  Future<List<Quote>> randoms(int quantity) async {
    final futures = List<Future<Quote>>();
    for (int i = 0; i < quantity; i++) futures.add(random());
    final quotes = await Future.wait(futures);
    return Future.value(quotes);
  }

  Future<List<Quote>> search(String term) async {
    //Proxy here!
    final cache = _pastSearchViewModel.getFromCache(term);
    if (cache != null) return cache.result;

    final response = await _session.request(
      service: QuotesService(QuotesSearchRequest(term)),
      responseType: QuotesSearchResponse(term),
    );

    if (response is QuotesSearchResponse) {
      _pastSearchViewModel.addItem(response.searchResult);
      return response.searchResult.result;
    }
    if (response is ErrorMapable) return Future.error(response.message);
    return Future.error(AppStrings.genericError);
  }

  Future<List<Quote>> searchByCategory(Category category) async {
    final response = await _session.request(
      service: QuotesService(QuotesRandomCategoryRequest(category)),
      responseType: QuotesRandomCategoryResponse(),
    );

    if (response is QuotesRandomCategoryResponse) {
      return [response.quote];
    }
    if (response is ErrorMapable) return Future.error(response.message);
    return Future.error(AppStrings.genericError);
  }
}
