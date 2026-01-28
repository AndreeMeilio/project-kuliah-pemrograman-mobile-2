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
    this.borderColor,
    this.buttonColor,
    this.splashColor,
    this.radius = AppNumbers.defaultRadius,
    this.labelColor,
    this.isLoading = false,
    this.padding
  });

  final Color? borderColor;
  final Color? buttonColor;
  final Color? splashColor;
  final String label;
  final Function()? onTap;
  final double radius;
  final Color? labelColor;
  final EdgeInsetsGeometry? padding;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor ?? Theme.of(context).colorScheme.outline
        ),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: buttonColor ?? Theme.of(context).colorScheme.primary
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: splashColor ?? Theme.of(context).colorScheme.outline,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          onTap: onTap,
          child: Padding(
            padding: padding != null ? padding! : const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 12.0
            ),
            child: isLoading
              ? Center(
                  child: CircularProgressIndicator(color: Theme.of(context).colorScheme.primary),
                )
              : Text(
                  label,
                  style: AppTextStyle.kBody1.get().copyWith(
                    color: labelColor ?? Theme.of(context).colorScheme.onSurface,
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