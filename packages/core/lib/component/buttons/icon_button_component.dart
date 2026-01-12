
import 'package:core/constant/colors.dart';
import 'package:core/constant/spacings.dart';
import 'package:flutter/material.dart';

class IconButtonComponent extends StatelessWidget {
  const IconButtonComponent({
    super.key,
    required this.icon,
    required this.onPressed,
    this.iconColor,
    this.buttonColor,
    this.borderColor,
  });

  final IconData icon;
  final Color? iconColor;
  final Color? buttonColor;
  final Color? borderColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.outline
        ),
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        color: buttonColor ?? Theme.of(context).colorScheme.primary
      ),
      child: IconButton(
        icon: Icon(icon, color: iconColor ?? Theme.of(context).colorScheme.onSurface),
        onPressed: onPressed
      ),
    );
  }
}