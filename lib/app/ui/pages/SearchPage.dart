import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final String term;
  const SearchPage(this.term, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.term),
      ),
    );
  }
}
