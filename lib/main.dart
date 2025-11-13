import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rest_well_aurant/cubit/customer_review_list_cubit.dart';
import 'package:rest_well_aurant/cubit/restaurant_detail_cubit.dart';
import 'package:rest_well_aurant/cubit/restaurant_list_cubit.dart';
import 'package:rest_well_aurant/pages/restaurant_list_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: GoogleFonts.interTextTheme()
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RestaurantListCubit(),
          ),
          BlocProvider(
            create: (context) => RestaurantDetailCubit(),
          ),
          BlocProvider(
            create: (context) => CustomerReviewListCubit(),
          )
        ],
        child: RestaurantListPage(),
      )
    );
  }
}
