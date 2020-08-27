import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../tiles/quote_tile.dart';
import '../widgets/loading_widget.dart';
import '../widgets/home_empty_state.dart';
import '../widgets/no_results.dart';
import '../widgets/random_icon.dart';
import '../../helpers/dependency_assembly.dart';
import '../../shared/data/models/quote.dart';
import '../../shared/data/viewmodels/shared_prefs_settings.dart';
import '../../shared/repositories/providers/home_results.dart';
import '../../../constants/app_assets_images.dart';
import '../../../constants/app_routes.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  final _settings = dependencyAssembler.get<SharedPrefsSettings>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          RandomIcon(),
          IconButton(
            icon: Image.asset(AppAssetsImages.search),
            onPressed: () => Navigator.of(context).pushNamed(
              AppRoutes.search,
            ),
          ),
        ],
      ),
      body: Consumer<HomeResultsChanger>(
        builder: (
          BuildContext context,
          HomeResultsChanger homeResultsChanger,
          _,
        ) {
          return FutureBuilder(
            future: homeResultsChanger.snapshotQuotes,
            builder: (
              BuildContext context,
              AsyncSnapshot<List<Quote>> snapshot,
            ) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return LoadingWidget();
              if (snapshot.hasError) return _error(context);
              if (!snapshot.hasData)
                return _settings.hasAlreadySearch
                    ? NoResults()
                    : HomeEmptyState();
              return _results(context, snapshot.data);
            },
          );
        },
      ),
    );
  }

  Widget _error(BuildContext context) {
    return Center(
      child: Icon(Icons.error),
    );
  }

  Widget _results(BuildContext context, List<Quote> quotes) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return QuoteTile(quotes[index]);
      },
      separatorBuilder: (_, __) => Divider(),
      itemCount: quotes?.length ?? 0,
    );
  }
}
