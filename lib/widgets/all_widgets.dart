import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Widget textWidget(
    {required String textInput,
    Color? textColor,
    double? textFontSize,
    FontWeight? textFontWeight,
    TextAlign? textAlign
    }) {
  return Text(
    textInput,
    textAlign: textAlign ?? TextAlign.start,
    style: TextStyle(
        color: textColor ?? Colors.black,
        fontSize: textFontSize ?? 20,
        fontWeight: textFontWeight ?? FontWeight.w400),
  ).tr();
}

Widget iconWidget(
    {required IconData inputIcon, double? iconSize, Color? iconColor}) {
  return Icon(
    inputIcon,
    size: iconSize ?? 25,
    color: iconColor ?? Colors.black,
  );
}

Widget spaceWidget({required int direction, required double spaceSize}) {
  return direction == 1
      ? SizedBox(
          height: spaceSize,
        )
      : direction == 0
          ? SizedBox(
              width: spaceSize,
            )
          : const SizedBox.shrink();
}
