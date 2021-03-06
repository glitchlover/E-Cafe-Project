// ignore_for_file: prefer_initializing_formals, overridden_fields, use_key_in_widget_constructors, must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:versity_project_coffee/Theme/mColors.dart';

class MText extends AutoSizeText {
  MText(this.data, {this.fontWeight, this.fontSize, this.color}) : super('');

  Color? color = MColors.black1;
  double? fontSize = 16.0;
  FontWeight? fontWeight = FontWeight.normal;

  @override
  final String data;

  AutoSizeText text() {
    return AutoSizeText(data, style: textThemePoppins(color, fontWeight, fontSize), maxLines: 2,overflow: TextOverflow.ellipsis,);
  }

  Text heading1() {
    fontWeight = FontWeight.bold;
    fontSize = 28;
    return Text(data, style: textThemePoppins(color, fontWeight, fontSize));
  }

  TextStyle textThemePoppins(
      Color? color, FontWeight? fontWeight, double? fontSize) {
    return GoogleFonts.poppins(
        textStyle: TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
      overflow: TextOverflow.ellipsis
    ));
  }

  TextStyle textThemeMarkScript(
      Color? color, FontWeight? fontWeight, double? fontSize) {
    return GoogleFonts.marckScript(
        textStyle: TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
      overflow: TextOverflow.ellipsis
    ));
  }

  String sString() {
    return 'MText(data: $data, color: $color, fontWeight: $fontWeight, fontSize: $fontSize)';
  }
}
