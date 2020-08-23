import 'package:flutter/material.dart';
import '../../shared/data/models/category.dart';

class CategoryTile extends StatelessWidget {
  final Category category;
  const CategoryTile(this.category, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(category.name);
  }
}
