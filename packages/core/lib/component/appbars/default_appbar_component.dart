import 'package:core/constant/colors.dart';
import 'package:core/constant/text_styles_enum.dart';
import 'package:core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class DefaultAppbarComponent extends StatelessWidget implements PreferredSizeWidget{
  const DefaultAppbarComponent({
    super.key,
    required this.title,
    this.backgroundColor = AppColors.backgroundColor,
    this.isCenterTitle = false,
    this.actions
  });

  final String title;
  final Color backgroundColor;
  final bool isCenterTitle;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTextStyle.kHeading2.get(),
      ),
      centerTitle: isCenterTitle,
      backgroundColor: backgroundColor,
      actions: actions,
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}