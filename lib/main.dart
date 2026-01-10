import 'package:core/constant/colors.dart';
import 'package:core/constant/routes.dart';
import 'package:core/localizations/cubit/app_localizations_cubit.dart';
import 'package:core/localizations/gen/app_localizations.dart';
import 'package:core/utils/locators.dart';
import 'package:core/utils/routes.dart';
import 'package:core/utils/text_styles.dart';
import 'package:countries/presentation/cubits/country_cubit.dart';
import 'package:todos/presentation/cubits/todos_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupLocators();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodosCubit(
            getTodos: sl(),
            insertTodos: sl(),
            deleteTodos: sl(),
          ),
        ),
        BlocProvider(
          create: (context) => CountryCubit(
            getAllCountry: sl()
          ),
        ),
        BlocProvider(
          create: (context) => AppLocalizationsCubit(),
        )
      ],
      child: BlocBuilder<AppLocalizationsCubit, Locale>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.bluePrimary),
              useMaterial3: true,
            ),
            onGenerateRoute: AppRoutes.onGenerateRoute,
            initialRoute: AppRoutesName.todosList,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: state,
          );
        },
      )
    );
  }
}