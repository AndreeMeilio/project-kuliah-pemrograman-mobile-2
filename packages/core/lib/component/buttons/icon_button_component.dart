
import 'package:core/constant/colors.dart';
import 'package:core/constant/spacings.dart';
import 'package:flutter/material.dart';

class IconButtonComponent extends StatelessWidget {
  const IconButtonComponent({
    super.key,
    required this.icon,
    required this.onPressed,
    this.iconColor = AppColors.whitePrimary,
    this.buttonColor = AppColors.bluePrimary,
    this.borderColor = AppColors.whitePrimary,
  });

  final IconData icon;
  final Color iconColor;
  final Color buttonColor;
  final Color borderColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor
        ),
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        color: buttonColor
      ),
      child: IconButton(
        icon: Icon(icon, color: iconColor),
        onPressed: onPressed
      ),
    );
  }
}