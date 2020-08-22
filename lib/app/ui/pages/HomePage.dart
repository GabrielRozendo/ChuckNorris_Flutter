import 'package:chucknorris_quotes/constants/app_routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () => Navigator.of(context).pushNamed(
            AppRoutes.search,
            arguments: 'Search',
          ),
          child: Text('Search'),
        ),
      ),
    );
  }
}
