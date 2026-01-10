
import 'package:core/constant/locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLocalizationsCubit extends Cubit<Locale>{
  AppLocalizationsCubit(): super(AppLocale.en);

  Locale _locale = AppLocale.en;

  Locale get localeCode => _locale;

  void changeLanguage(Locale locale){
    _locale = locale;

    emit(_locale);
  }
}