import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../tiles/quote_tile.dart';
import '../widgets/home_empty_state.dart';
import '../../shared/data/models/quote.dart';
import '../../shared/repositories/providers/home_results.dart';
import '../../shared/repositories/quotes/service/quotes_repository.dart';
import '../../../constants/app_assets_images.dart';
import '../../../constants/app_routes.dart';

class HomePage extends StatelessWidget {
  final QuotesRepository service = QuotesRepository();

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
      body: Consumer<HomeResultsChanger>(
        builder:
            (BuildContext context, HomeResultsChanger homeResultsChanger, _) =>
                FutureBuilder(
          future: homeResultsChanger.snapshotQuotes,
          builder: (BuildContext context, AsyncSnapshot<List<Quote>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return _loading(context);
            if (snapshot.hasError) return _error(context);
            if (!snapshot.hasData) return HomeEmptyState();
            return _results(context, snapshot.data);
          },
        ),
      ),
    );
  }

  Widget _loading(BuildContext context) => Center(
        child: CircularProgressIndicator(),
      );

  Widget _error(BuildContext context) => Center(
        child: Icon(Icons.error),
      );

  Widget _results(BuildContext context, List<Quote> quotes) =>
      ListView.separated(
        itemBuilder: (BuildContext context, int index) =>
            QuoteTile(quotes[index]),
        separatorBuilder: (_, __) => Divider(),
        itemCount: quotes?.length ?? 0,
      );
}
