import 'package:core/component/buttons/primary_button_component.dart';
import 'package:core/constant/colors.dart';
import 'package:core/constant/numbers.dart';
import 'package:core/constant/spacings.dart';
import 'package:core/constant/text_styles_enum.dart';
import 'package:core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class OutlinedTextFieldComponent extends StatelessWidget {
  const OutlinedTextFieldComponent({
    super.key,
    required this.label,
    required this.controller,
    this.maxLines = 1,
    this.validator,
    this.isPassword = false,
    this.hint

  });

  const OutlinedTextFieldComponent.textArea({
    super.key,
    required this.label,
    required this.controller,
    required this.maxLines,
    this.validator,
    this.isPassword = false,
    this.hint
  });

  final String label;
  final TextEditingController controller;
  final int maxLines;
  final String? Function(String?)? validator;
  final bool? isPassword;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: AppSpacing.defaultMargin),
          child: Text(
            label,
            style: AppTextStyle.kBody1.get(), 
          ),
        ),
        const SizedBox(height: AppSpacing.defaultLabelFieldSpace,),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: AppSpacing.defaultMargin),
          child: TextFormField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppNumbers.defaultRadius)),
              ),
              hint: Text(
                hint ?? "",
                style: AppTextStyle.kBody1.get().copyWith(
                  color: Colors.black.withAlpha(100)
                )
              ),
            ),
            style: AppTextStyle.kBody1.get(),
            validator: validator,
            obscureText: isPassword ?? false,
          ),
        ),
      ],
    );
  }
}