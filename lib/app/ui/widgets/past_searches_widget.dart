import 'package:flutter/material.dart';

import '../../../app/shared/data/models/search_result.dart';

class PastSearchesWidget extends StatelessWidget {
  final List<SearchResult> pastSearches;
  final void Function(SearchResult) action;
  const PastSearchesWidget(this.pastSearches, this.action, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        _tile,
        childCount: pastSearches.length,
      ),
    );
  }

  Widget _tile(BuildContext context, int index) {
    final item = pastSearches[index];
    return InkWell(
      onTap: () => action(item),
      child: Text(item.term),
    );
  }
}
