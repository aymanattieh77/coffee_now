import 'package:flutter/material.dart';

abstract class FontSizes {
  static const double f8 = 8.0;
  static const double f10 = 10.0;
  static const double f12 = 12.0;
  static const double f14 = 14.0;
  static const double f16 = 16.0;
  static const double f18 = 18.0;
  static const double f24 = 24.0;
  static const double f28 = 28.0;
  static const double f36 = 36.0;
}

enum FontWe { medium, regular, semiBold }

enum FontFamily {
  poppins,
  bebasNeue,
}

extension FontsEX on FontWe {
  FontWeight getFontweight() {
    switch (this) {
      case FontWe.regular:
        return FontWeight.w400;
      case FontWe.medium:
        return FontWeight.w500;
      case FontWe.semiBold:
        return FontWeight.w600;
    }
  }
}

extension FontFamiliesEx on FontFamily {
  String getFontFamily() {
    switch (this) {
      case FontFamily.poppins:
        return "poppins";
      case FontFamily.bebasNeue:
        return "Bebas Neue";
    }
  }
}
