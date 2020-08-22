import 'package:chucknorris_quotes/app/shared/data/models/category.dart';
import 'package:flutter/material.dart';

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
      children: categories.map((e) => _tile(context, e)).toList(),
    );
  }

  Widget _tile(BuildContext context, Category category) => Text(category.name);
}
