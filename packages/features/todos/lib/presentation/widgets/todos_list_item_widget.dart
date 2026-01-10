import 'package:core/constant/colors.dart';
import 'package:core/constant/numbers.dart';
import 'package:core/constant/spacings.dart';
import 'package:core/constant/text_styles_enum.dart';
import 'package:core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class TodosListItemWidget extends StatelessWidget {
  const TodosListItemWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.date,
    required this.onTap
  });

  final String title;
  final String subTitle;
  final String date;
  final Function()? onTap; 

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.defaultMargin,
        vertical: 4.0
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.blackPrimary
        ),
        borderRadius: const BorderRadius.all(Radius.circular(AppNumbers.defaultRadius)),
        color: AppColors.bluePrimary
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: AppColors.splashColor,
          borderRadius: const BorderRadius.all(Radius.circular(AppNumbers.defaultRadius)),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.defaultPadding,
              vertical: 12.0
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: AppTextStyle.kHeading3.get().copyWith(
                    color: AppColors.whitePrimary
                  ),
                ),
                Text(
                  subTitle,
                  style: AppTextStyle.kBody1.get().copyWith(
                    color: AppColors.whitePrimary
                  ),
                ),
                const SizedBox(height: AppSpacing.defaultHorizontalSpace,),
                Text(
                  date,
                  style: AppTextStyle.kBody1.get().copyWith(
                    color: AppColors.whitePrimary
                  )
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}