import 'package:chucknorris_quotes/app/shared/data/models/category.dart';
import 'package:flutter/material.dart';
import '../tiles/category_tile.dart';

class SuggestionsWidget extends StatelessWidget {
  final List<Category> list;
  final void Function(Category) action;
  SuggestionsWidget(this.list, this.action, {Key key}) : super(key: key);

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
        (BuildContext context, int index) {
          final item = list[index];
          return Card(
            child: InkWell(
              onTap: () => action(item),
              child: GridTile(
                child: CategoryTile(item),
              ),
            ),
          );
        },
        childCount: list.length,
      ),
    );
  }
}
