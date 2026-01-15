
import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:core/constant/page_routes.dart';
import 'package:page_transition/page_transition.dart';
import 'package:products/products.dart';

class AppRoutes{
  static Route<dynamic>? onGenerateRoute(RouteSettings settings){
    switch (settings.name){
      case AppPageRoutesName.loginPage:
        return PageTransition(
          type: PageTransitionType.fade,
          child: LoginPage(),
        );
      case AppPageRoutesName.registerPage:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: RegisterPage()
        );
      case AppPageRoutesName.productListPage:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: ProductListPage()
        );
    }
  }
}