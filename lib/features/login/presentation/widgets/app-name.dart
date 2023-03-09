import 'package:ecom_clean_code/app/theme/app_colors.dart';
import 'package:ecom_clean_code/core/constants/constants.dart';
import 'package:flutter/material.dart';

Widget appName(BuildContext context) {
  final appName = StringConstant.appName.split(' ');
  return RichText(
    text: TextSpan(
      text: appName.first,
      style:
          Theme.of(context).textTheme.headline1!.copyWith(color: Colors.white),
      children: <TextSpan>[
        TextSpan(
          text: "  ${appName.last}",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColors.blueDark),
        ),
      ],
    ),
  );
}
