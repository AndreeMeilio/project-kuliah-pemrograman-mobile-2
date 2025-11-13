import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rest_well_aurant/cubit/customer_review_list_cubit.dart';
import 'package:rest_well_aurant/cubit/restaurant_detail_cubit.dart';
import 'package:rest_well_aurant/cubit/restaurant_list_cubit.dart';
import 'package:rest_well_aurant/cubit/restaurant_search_cubit.dart';
import 'package:rest_well_aurant/pages/profile_page.dart';
import 'package:rest_well_aurant/pages/restaurant_list_page.dart';
import 'package:rest_well_aurant/pages/restaurant_search_page.dart';
import 'package:rest_well_aurant/utils/colors_util.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int currentIndex = 0;

  List<Widget> mainPage = [
    RestaurantListPage(),
    RestaurantSearchPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorsUtil.primaryColor),
        textTheme: GoogleFonts.interTextTheme()
      ),
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider<RestaurantListCubit>(
              create: (context) => RestaurantListCubit(),
            ),
            BlocProvider<RestaurantSearchCubit>(
              create: (context) => RestaurantSearchCubit(),
            ),
          ],
          child: mainPage[currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Beranda"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Cari"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profil"
            ),
          ],
          currentIndex: currentIndex,
          onTap: (index){
            setState(() {
              currentIndex = index;
            });
          },
        ),
      )
    );
  }
}
