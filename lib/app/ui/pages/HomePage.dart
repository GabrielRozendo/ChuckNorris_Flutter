import 'package:chucknorris_quotes/app/shared/data/models/quote.dart';
import 'package:chucknorris_quotes/constants/app_assets_images.dart';
import 'package:chucknorris_quotes/constants/app_dimens.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_routes.dart';
import '../../shared/repositories/quotes/service/quotes_repository.dart';

class HomePage extends StatelessWidget {
  final QuotesRepository service = QuotesRepository();
  List<Quote> _quotes = [
    Quote(
        categories: [],
        createdAt: DateTime.now(),
        iconUrl: '',
        id: '',
        updatedAt: DateTime.now(),
        url: '',
        value: ''),
  ];
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
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
              'Nothing to show here!',
              style: Theme.of(context).primaryTextTheme.subtitle1,
            ),
          ],
        ),
      );

  Widget _list(BuildContext context) => ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return Text(index.toString());
      },
      separatorBuilder: (_, __) => Divider(),
      itemCount: _quotes?.length ?? 0);
}
