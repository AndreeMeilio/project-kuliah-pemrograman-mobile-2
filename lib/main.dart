import 'package:core/constant/colors.dart';
import 'package:core/constant/page_routes.dart';
import 'package:core/core.dart';
import 'package:core/localizations/cubit/app_localizations_cubit.dart';
import 'package:core/localizations/gen/app_localizations.dart';
import 'package:core/utils/locators.dart';
import 'package:core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:products/datas/data_sources/remote_data_source.dart';
import 'package:products/datas/models/product_model.dart';
import 'package:products/datas/repositories/product_repository.dart';
import 'package:products/domains/use_cases/get_all_products.dart';
import 'package:products/locators.dart';

void main() {
  setupLocators();
  setupProductLocator(sl);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.bluePrimary),
        useMaterial3: true,
      ),
      // onGenerateRoute: AppRoutes.onGenerateRoute,
      // initialRoute: AppPageRoutesName.todosList,
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // locale: state,
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  HomeWidget({super.key});

  final getAllProducts = sl.get<GetAllProducts>(instanceName: "getAllProducts");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            
          }, 
          child: Text("CLICK ME")
        ),
      ),
    );
  }
}