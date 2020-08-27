import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_share/flutter_share.dart';

import '../../shared/data/models/quote.dart';
import '../../ui/widgets/circle_image_button.dart';
import '../../../constants/app_assets_images.dart';
import '../../../constants/app_dimens.dart';

import '../widgets/categories_widget.dart';

class QuoteTile extends StatelessWidget {
  final Quote quote;
  const QuoteTile(this.quote, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _card(context),
        _quoteMark(context),
        _share(context),
        _picture(context),
      ],
    );
  }

  Widget _quoteMark(BuildContext context) {
    return Positioned(
      child: Opacity(
        opacity: 0.7,
        child: Image.asset(
          AppAssetsImages.quoteLeft,
          color: Theme.of(context).accentColor,
          width: 40,
          height: 40,
        ),
      ),
      top: 24,
      left: 24,
    );
  }

  Widget _share(BuildContext context) {
    return Positioned(
      child: CircleImageButton(
        AppAssetsImages.share,
        () => FlutterShare.share(title: quote.url),
      ),
      bottom: 12,
      right: 32,
    );
  }

  Widget _picture(BuildContext context) {
    return Positioned(
      child: CachedNetworkImage(
        imageUrl: quote.iconUrl,
        fadeInDuration: Duration(milliseconds: 500),
        height: 40,
        width: 40,
      ),
      top: 8,
      right: 8,
    );
  }

  Widget _card(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(
        AppDimens.paddingL,
        AppDimens.paddingL,
        AppDimens.paddingL,
        AppDimens.paddingXL,
      ),
      child: Container(
        padding: EdgeInsets.all(AppDimens.paddingM),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            _quoteText(context),
            _category(context),
          ],
        ),
      ),
    );
  }

  Widget _quoteText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppDimens.paddingXL,
        AppDimens.paddingXL,
        AppDimens.paddingL,
        AppDimens.paddingL,
      ),
      child: Text(
        quote.value,
        style: quote.value.length > 80
            ? Theme.of(context).primaryTextTheme.bodyText2
            : Theme.of(context).primaryTextTheme.bodyText1,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _category(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppDimens.paddingL,
        bottom: AppDimens.paddingL,
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: CategoriesWidget(quote.categories),
      ),
    );
  }
}
