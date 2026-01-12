import 'package:auth/auth.dart';
import 'package:core/core.dart';
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
          create: (context) => sl.get<LoginCubit>(instanceName: "loginCubit"),
          lazy: true,
        )
      ], 
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme(
            brightness: Brightness.light,

            primary: AppColors.primary,
            onPrimary: AppColors.onPrimary,
            primaryContainer: AppColors.primaryContainer,
            onPrimaryContainer: AppColors.onPrimaryContainer,

            secondary: AppColors.secondary,
            onSecondary: AppColors.onSecondary,

            surface: AppColors.surface,
            onSurface: AppColors.onSurface,

            error: AppColors.error,
            onError: AppColors.onError,

            outline: AppColors.outline,
          ),
        ),

        onGenerateRoute: AppRoutes.onGenerateRoute,
        initialRoute: AppPageRoutesName.loginPage,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        // locale: state,
        // home: HomeWidget(),
      )
    );
  }
}

// class HomeWidget extends StatelessWidget {
//   const HomeWidget({super.key});

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {

//           }, 
//           child: Text("CLICK ME")
//         ),
//       ),
//     );
//   }
// }