
import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:products/presentations/cubits/product_filter_cubit.dart';
import 'package:products/products.dart';
import 'package:users/users.dart';

class AppRoutes{
  static Route<dynamic>? onGenerateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch (settings.name){
      case AppPageRoutesName.loginPage:
        return PageTransition(
          type: PageTransitionType.fade,
          child: BlocProvider(
            create: (context) => sl.get<LoginCubit>(instanceName: "loginCubit"), lazy: true,
            child: LoginPage()
          ),
        );
      case AppPageRoutesName.registerPage:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl.get<RegisterPasswordValidationCubit>(instanceName: "registerPasswordValidationCubit"), lazy: true,
              ),
              BlocProvider(
                create: (context) => sl.get<RegisterCubit>(instanceName: "registerCubit"), lazy: true,
              ),
            ], 
            child: RegisterPage()
          )
        );
      case AppPageRoutesName.productListPage:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl.get<ProductListCubit>(instanceName: "productListCubit"),
              ),
              BlocProvider(
                create: (context) => sl.get<ProductCategoryCubit>(instanceName: "productCategoryCubit"),
              ),
              BlocProvider(
                create: (context) {
                  return sl.get<HomeCubit>(instanceName: "homeCubit");
                },
              ),
              BlocProvider(
                create: (context) {
                  return sl.get<ProfileCubit>(instanceName: "profileCubit");
                },
              ),
              BlocProvider(
                create: (context) => sl.get<ProfileChangePasswordValidationCubit>(instanceName: "profileChangePasswordValidationCubit"),
              ),
              BlocProvider(
                create: (context) => sl.get<ProfileChangePasswordCubit>(instanceName: "profileChangePasswordCubit"),
              ),
              BlocProvider(
                create: (context) => sl.get<ProductFilterCubit>(instanceName: "productFilterCubit"),
              )
            ], 
            child: HomePage()
          ) 
        );
      case AppPageRoutesName.productDetailPage:
        String idProduct = "";
        if (args case String id){
          idProduct = id;
        }

        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: BlocProvider(
            create: (context) {
                return sl.get<ProductDetailCubit>(instanceName: "productDetailCubit");
            },
            child: ProductDetailPage(id: idProduct,),
          ),
        );
    }
  }
}