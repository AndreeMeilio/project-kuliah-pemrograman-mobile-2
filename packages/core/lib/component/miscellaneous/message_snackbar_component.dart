import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

enum MessageSnackbarType{
  success,
  error,
  info
}

void showMessageSnackbar({required BuildContext context, required MessageSnackbarType type, required String message}){

  late Widget snackbarWidget;

  switch(type){
    case MessageSnackbarType.success:
      snackbarWidget = CustomSnackBar.success(
        message: message,
        backgroundColor: AppColors.success,
        textStyle: AppTextStyle.kBody1.get().copyWith(color: AppColors.onPrimary),
      );
    case MessageSnackbarType.error:
      snackbarWidget = CustomSnackBar.error(
        message: message,
        backgroundColor: AppColors.error,
        textStyle: AppTextStyle.kBody1.get().copyWith(color: AppColors.onPrimary),
      );
    case MessageSnackbarType.info:
      snackbarWidget = CustomSnackBar.success(
        message: message,
        backgroundColor: Theme.of(context).colorScheme.primary,
        textStyle: AppTextStyle.kBody1.get(),
      );
  }

  showTopSnackBar(Overlay.of(context), snackbarWidget);
}