import 'package:chucknorris_quotes/constants/app_dimens.dart';
import 'package:flutter/material.dart';

class CircleImageButton extends StatelessWidget {
  final String assetPath;
  final Function function;
  const CircleImageButton(this.assetPath, this.function, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(99),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.all(Radius.circular(99)),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 2),
            ),
          ],
        ),
        width: 40,
        height: 40,
        child: IconButton(
          icon: Image.asset(assetPath),
          onPressed: function,
        ),
      ),
    );
  }
}
