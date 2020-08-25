import 'package:flutter/material.dart';
import '../../../constants/app_assets_images.dart';
import '../../../constants/app_dimens.dart';
import '../../../constants/app_strings.dart';

class HomeEmptyState extends StatefulWidget {
  HomeEmptyState({Key key}) : super(key: key);

  @override
  _HomeEmptyStateState createState() => _HomeEmptyStateState();
}

class _HomeEmptyStateState extends State<HomeEmptyState>
    with TickerProviderStateMixin {
  AnimationController _motionController;
  double _size = 40;

  @override
  void initState() {
    super.initState();

    _motionController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      lowerBound: 0.75,
    );

    _motionController.forward();
    _motionController.addStatusListener((status) {
      setState(() {
        _size = _motionController.value * 40;
        if (status == AnimationStatus.completed)
          _motionController.reverse();
        else if (status == AnimationStatus.dismissed)
          _motionController.forward();
      });
    });
  }

  @override
  void dispose() {
    _motionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _hint,
        _hintText,
        _centerInfo,
      ],
    );
  }

  Widget get _centerInfo => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              AppAssetsImages.unavailable,
              color: Theme.of(context).primaryIconTheme.color,
              width: 60,
              height: 60,
            ),
            SizedBox(height: AppDimens.paddingM),
            Text(
              AppStrings.emptyStateMessage,
              style: Theme.of(context).primaryTextTheme.subtitle1,
            ),
          ],
        ),
      );

  Widget get _hint => Positioned(
        right: 24,
        top: 8,
        child: _animatedIcon,
      );

  Widget get _hintText => Positioned(
        right: 20,
        top: 48,
        child: Text(
          AppStrings.emptyStateHint,
          style: Theme.of(context).primaryTextTheme.subtitle1,
        ),
      );

  Widget get _animatedIcon => SizedBox(
        height: _size + AppDimens.paddingM,
        width: _size + AppDimens.paddingM,
        child: Center(
          child:
              // AnimatedSize(
              //       curve: Curves.easeIn,
              //       vsync: this,
              //       duration: Duration(seconds: 1),
              //       child:
              Image.asset(
            AppAssetsImages.arrowUpRight,
            color: Theme.of(context).primaryIconTheme.color,
            width: _size,
            height: _size,
          ),
        ),
      );
}
