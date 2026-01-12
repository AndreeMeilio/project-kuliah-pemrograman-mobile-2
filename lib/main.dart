import 'package:auth/domains/entities/auth.dart';
import 'package:auth/domains/use_cases/login.dart';
import 'package:auth/locators.dart';
import 'package:carts/domains/use_cases/get_all_cart_filter.dart';
import 'package:carts/locators.dart';
import 'package:core/constant/colors.dart';
import 'package:core/constant/page_routes.dart';
import 'package:core/core.dart';
import 'package:core/domain/auth_repository.dart';
import 'package:core/domain/cart_repository.dart';
import 'package:core/domain/user_repository.dart';
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
import 'package:users/domains/entities/user.dart';
import 'package:users/domains/entities/user_address.dart';
import 'package:users/domains/entities/user_name.dart';
import 'package:users/domains/use_cases/create_user.dart';
import 'package:users/locators.dart';

void main() {
  setupLocators();
  setupProductLocator(sl);
  setupCartLocator(sl);
  setupUsersLocator(sl);
  setupAuthLocator(sl);
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
  const HomeWidget({super.key});

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