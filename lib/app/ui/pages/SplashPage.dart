import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../widgets/loading_widget.dart';
import '../../shared/data/viewmodels/categories_model..dart';
import '../../../constants/app_routes.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoriesViewModel = Provider.of<CategoriesViewModel>(context);
    if (categoriesViewModel.isReady &&
        categoriesViewModel.categories.isNotEmpty)
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushNamed(AppRoutes.home);
      });

    return Scaffold(
      body: Center(child: LoadingWidget()),
    );
  }
}
