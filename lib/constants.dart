import 'package:flutter/material.dart';
import 'package:pharmakilivre/utils/size_config.dart';

OutlineInputBorder defaultOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(30),
  borderSide: const BorderSide(color: Color(0xFFF3F3F3)),
);




class AppColors {
  static const Color primaryColor = Color(0xFF36AA05);
  static const Color kTextColor= Color(0xFF000000);
  static const Color backgroundColor = Color(0xFFE5E5E5);
  static const Color InActiveIconColor = Color(0xFF36AA05);
}



final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)), borderSide: BorderSide(color: AppColors.kTextColor)),
  focusedBorder: outlineInputBorder(borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)), borderSide: BorderSide(color: AppColors.primaryColor)),
  enabledBorder: outlineInputBorder(borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)), borderSide: BorderSide(color: AppColors.kTextColor)),
);

OutlineInputBorder outlineInputBorder({required BorderRadius borderRadius, required BorderSide borderSide}) {
  return OutlineInputBorder(
    borderRadius: borderRadius,
    borderSide: borderSide,
  );
}




