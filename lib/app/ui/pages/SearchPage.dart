import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/past_searches_widget.dart';
import '../widgets/suggestions_widget.dart';
import '../../shared/data/models/category.dart';
import '../../shared/repositories/providers/home_results.dart';
import '../../shared/repositories/quotes/service/quotes_repository.dart';
import '../../../constants/app_assets_images.dart';
import '../../../constants/app_dimens.dart';
import '../../../constants/app_strings.dart';

class SearchPage extends StatelessWidget {
  final repository = QuotesRepository();
  final categories = List<Category>.of([
    Category(name: 'Dev'),
    Category(name: 'Humor'),
    Category(name: 'Think'),
    Category(name: 'Dev'),
    Category(name: 'Humor'),
    Category(name: 'Think'),
    Category(name: 'Dev'),
    Category(name: 'Humor'),
  ]);
  final pastSearches = List<String>.of([
    'girl',
    'blah',
    'aaa',
    'girl',
    'blah',
    'aaa',
    'girl',
    'blah',
    'aaa',
  ]);

  SearchPage({Key key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _searchController = TextEditingController();
  final _searchFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: CustomScrollView(
            slivers: <Widget>[
              _appBar(context),
              SliverToBoxAdapter(child: Divider()),
              SuggestionsWidget(categories),
              PastSearchesWidget(pastSearches),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) => SliverAppBar(
        title: Text('Search'),
        pinned: true,
        floating: true,
        snap: true,
        leading: IconButton(
          icon: Image.asset(AppAssetsImages.back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Center(
            child: Container(
                padding: EdgeInsets.all(AppDimens.paddingM),
                child: _searchField(context)),
          ),
        ),
      );

  Widget _searchField(BuildContext context) => Form(
        key: _formKey,
        child: TextFormField(
          controller: _searchController,
          focusNode: _searchFocus,
          decoration: InputDecoration(
            labelText: AppStrings.searchLabel,
            labelStyle: Theme.of(context).primaryTextTheme.subtitle1,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                color: Theme.of(context).accentColor,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(), //Theme.of(context).accentColor),
            ),
            suffixIcon: IconButton(
              icon: Image.asset(AppAssetsImages.search),
              onPressed: () => _search(context),
            ),
          ),
          validator: (value) {
            if (!_isSearchTextValid(value))
              return AppStrings.searchValidationError;
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          style: Theme.of(context).primaryTextTheme.subtitle1,
          onFieldSubmitted: (value) => _search(context),
        ),
      );

  bool _isSearchTextValid(String value) => value.length >= 3;

  void _search(BuildContext context) {
    _formKey.currentState.save();
    if (!_formKey.currentState.validate()) return;

    FocusScope.of(context).unfocus();
    Provider.of<HomeResultsChanger>(context, listen: false).updateSnapshot(
      repository.search(_searchController.text),
    );
    Navigator.of(context).pop();
  }
}
