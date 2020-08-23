import 'package:flutter/material.dart';
import '../tiles/category_tile.dart';
import '../../shared/data/models/category.dart';

class SuggestionsWidget extends StatelessWidget {
  final List<Category> data;
  SuggestionsWidget(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 4,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => Card(
          child: GridTile(
            child: CategoryTile(data[index]),
          ),
        ),
        childCount: data.length,
      ),
    );
  }
}
