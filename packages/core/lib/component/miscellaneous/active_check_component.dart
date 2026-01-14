import 'package:core/constant/text_styles_enum.dart';
import 'package:core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class ActiveCheckComponent extends StatelessWidget {
  const ActiveCheckComponent({
    super.key,
    required this.isActive,
    required this.text,
    this.uncheckColor,
    this.activeColor 
  });

  final Color? uncheckColor;
  final Color? activeColor;
  final bool isActive;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Container(
            height: 24.0,
            width: 24.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? (activeColor ?? Theme.of(context).colorScheme.primary) : Colors.transparent,
              border: BoxBorder.all(
                color: isActive ? (activeColor ?? Theme.of(context).colorScheme.primary) : Theme.of(context).colorScheme.onSurface.withAlpha(75)
              )
            ),
          ),
          const SizedBox(width: 16.0,),
          Text(
            text,
            style: AppTextStyle.kBody1.get().copyWith(
              color: isActive ? (activeColor ?? Theme.of(context).colorScheme.primary) : Theme.of(context).colorScheme.onSurface.withAlpha(125)
            ),
          ),
        ],
      ),
    );
  }
}