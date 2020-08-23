import 'package:flutter/material.dart';
import '../tiles/category_tile.dart';
import '../../shared/data/models/category.dart';

class CategoriesWidget extends StatelessWidget {
  final List<Category> categories;
  const CategoriesWidget(this.categories, {Key key})
      : assert(
          categories != null && categories.length > 0,
          'Must have at least one category',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: categories.map((e) => CategoryTile(e)).toList(),
    );
  }
}
