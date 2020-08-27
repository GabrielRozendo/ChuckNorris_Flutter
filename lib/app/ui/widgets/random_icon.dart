import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../helpers/dependency_assembly.dart';
import '../../shared/repositories/providers/home_results.dart';
import '../../shared/repositories/quotes/quotes_repository.dart';
import '../../../constants/app_assets_images.dart';
import '../../../constants/app_settings.dart';

class RandomIcon extends StatelessWidget {
  RandomIcon({Key key}) : super(key: key);
  final _repository = dependencyAssembler.get<QuotesRepository>();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(AppAssetsImages.random),
      onPressed: () => Provider.of<HomeResultsChanger>(context, listen: false)
          .updateSnapshot(_repository.randoms(AppSettings.randomQuantity)),
    );
  }
}
