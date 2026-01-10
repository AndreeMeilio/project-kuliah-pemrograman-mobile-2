import 'package:core/component/textfields/outlined_text_field_component.dart';
import 'package:core/constant/colors.dart';
import 'package:core/constant/numbers.dart';
import 'package:core/constant/spacings.dart';
import 'package:core/constant/text_styles_enum.dart';
import 'package:core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class TodosCreateFormWidget extends StatelessWidget {
  const TodosCreateFormWidget({
    super.key,
    required this.formKey,
    required this.judulController,
    required this.subJudulController,
    required this.contentController
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController judulController;
  final TextEditingController subJudulController;
  final TextEditingController contentController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: AppSpacing.defaultMargin,),
            OutlinedTextFieldComponent(
              controller: judulController,
              label: "Judul To Do",
              validator: (value){
                if (value == '' || value == null){
                  return "Judul bersifat mandatory";
                }
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.defaultMargin,),
            OutlinedTextFieldComponent(
              controller: subJudulController,
              label: "Sub Judul",
              validator: (value){
                if (value == '' || value == null || value.isEmpty){
                  return "Sub Judul bersifat mandatory";
                }
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.defaultMargin,),
            OutlinedTextFieldComponent.textArea(
              controller: contentController,
              label: "Content",
              maxLines: 15,
              validator: (value){
                if (value == '' || value == null || value.isEmpty){
                  return "Content bersifat mandatory";
                }
                return null;
              },
            )
          ],
        ),
      ),
    );
  }
}