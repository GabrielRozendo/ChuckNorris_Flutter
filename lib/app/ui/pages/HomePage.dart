import 'package:chucknorris_quotes/app/shared/data/models/category.dart';
import 'package:chucknorris_quotes/app/shared/data/models/quote.dart';
import 'package:chucknorris_quotes/app/ui/widgets/quote_tile.dart';
import 'package:chucknorris_quotes/constants/app_assets_images.dart';
import 'package:chucknorris_quotes/constants/app_dimens.dart';
import 'package:chucknorris_quotes/constants/app_strings.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_routes.dart';
import '../../shared/repositories/quotes/service/quotes_repository.dart';

class HomePage extends StatelessWidget {
  final QuotesRepository service = QuotesRepository();
  List<Quote> _quotes = [
    //TODO: Remove
    Quote(
      categories: [
        Category(name: 'dev'),
        Category(name: 'humor'),
      ],
      createdAt: DateTime.now(),
      iconUrl: 'https://assets.chucknorris.host/img/avatar/chuck-norris.png',
      id: 'KjILg4flRjyoyTU6tfvvfQ',
      updatedAt: DateTime.now(),
      url: 'https://api.chucknorris.io/jokes/KjILg4flRjyoyTU6tfvvfQ',
      value: 'Life is what Chuck Norris makes it.',
    ),
    Quote(
      categories: [Category(name: AppStrings.uncategorized)],
      createdAt: DateTime.now(),
      iconUrl: 'https://assets.chucknorris.host/img/avatar/chuck-norris.png',
      id: 'KjILg4flRjyoyTU6tfvvfQ',
      updatedAt: DateTime.now(),
      url: 'https://api.chucknorris.io/jokes/KjILg4flRjyoyTU6tfvvfQ',
      value:
          'asfd asklf asdçf jkaslçd jfaslçj dflaçsf jkaslçd jfaslçj dflaçs f jkaslçd jfaslçj dflaçs f jkaslçd jfaslçj dflaçs f jkaslçd jfaslçj dflaçs f jkaslçd jfaslçj dflaçs f jkaslçd jfaslçj dflaçsj dfldsaj lsaj fas lçfjsçl jflçhat Chuck Norris makes it.',
    ),
  ];
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Image.asset(AppAssetsImages.search),
            onPressed: () => Navigator.of(context).pushNamed(
              AppRoutes.search,
            ),
          ),
        ],
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) => _quotes == null || _quotes.isEmpty
      ? _emptyState(context)
      : _list(context);

  Widget _emptyState(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              AppAssetsImages.unavailable,
              color: Theme.of(context).primaryIconTheme.color,
              width: 60,
              height: 60,
            ),
            SizedBox(height: AppDimens.paddingM),
            Text(
              AppStrings.emptyStateMessage,
              style: Theme.of(context).primaryTextTheme.subtitle1,
            ),
          ],
        ),
      );

  Widget _list(BuildContext context) => ListView.separated(
      itemBuilder: (BuildContext context, int index) =>
          QuoteTile(_quotes[index]),
      separatorBuilder: (_, __) => Divider(),
      itemCount: _quotes?.length ?? 0);
}
