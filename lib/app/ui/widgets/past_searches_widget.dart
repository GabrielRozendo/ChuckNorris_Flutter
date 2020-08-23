import 'package:flutter/material.dart';
import '../../../app/shared/data/models/search_result.dart';

class PastSearchesWidget extends StatelessWidget {
  final List<SearchResult> pastSearches;
  const PastSearchesWidget(this.pastSearches, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        _tile,
        childCount: pastSearches.length,
      ),
    );
  }

  Widget _tile(BuildContext context, int index) =>
      Text(pastSearches[index].term);
}
