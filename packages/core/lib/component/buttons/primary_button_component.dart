import 'package:core/constant/colors.dart';
import 'package:core/constant/font_weight.dart';
import 'package:core/constant/numbers.dart';
import 'package:core/constant/text_styles_enum.dart';
import 'package:core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class PrimaryButtonComponent extends StatelessWidget {
  const PrimaryButtonComponent({
    super.key,
    required this.onTap,
    required this.label,
    this.borderColor = AppColors.blackPrimary,
    this.buttonColor = AppColors.bluePrimary,
    this.splashColor = AppColors.splashColor,
    this.radius = AppNumbers.defaultRadius,
    this.labelColor = AppColors.whitePrimary,
    this.isLoading = false
  });

  final Color borderColor;
  final Color buttonColor;
  final Color splashColor;
  final String label;
  final Function()? onTap;
  final double radius;
  final Color labelColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor
        ),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: buttonColor
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: splashColor,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 12.0
            ),
            child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: AppColors.bluePrimary,),
                )
              : Text(
                  label,
                  style: AppTextStyle.kBody1.get().copyWith(
                    color: labelColor,
                    fontWeight: AppFontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                )
          ),
        ),
      ),
    );
  }
}