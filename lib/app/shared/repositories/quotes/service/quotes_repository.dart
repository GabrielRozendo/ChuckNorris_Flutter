import 'quotes_service.dart';
import '../requests/categories/categories_response.dart';
import '../requests/categories/categories_request.dart';
import '../../../data/models/category.dart';
import '../../../network/http_session.dart';
import '../../../network/network_mappers.dart';
import '../../../../../constants/app_strings.dart';

class QuotesRepository {
  QuotesRepository._();

  static final _quotesRepository = QuotesRepository._();
  factory QuotesRepository() => _quotesRepository;

  final session = HttpSession();

  Future<List<Category>> getCategories() async {
    // if (AppSettings.UseMock) {
    //   final result = await session.requestMock(
    //       ListShowsResponse(), EnumShowEndpoints.fetchAll.mockAsset);
    //   return (result as ListShowsResponse).shows;
    // }

    final result = await session.request(
      service: QuotesService(QuotesCategoriesRequest()),
      responseType: QuotesCategoriesResponse(),
    );

    if (result is QuotesCategoriesResponse) return result.categories;
    if (result is ErrorMapable) return Future.error(result.message);
    return Future.error(AppStrings.genericError);
  }
}
