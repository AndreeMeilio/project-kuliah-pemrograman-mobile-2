import 'package:carts/carts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/products.dart';
import 'package:users/users.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late List<Widget> bodyHome;
  late HomeCubit _cubit;

  @override
  void initState() {
    super.initState();

    bodyHome = [
      ProductListPage(),
      CartsListPage(),
      ProfilePage()
    ];

    _cubit = BlocProvider.of<HomeCubit>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocBuilder<HomeCubit, int>(
        builder: (context, state) {
          return bodyHome[state];
        },
      ),
      bottomNavigationBar: BlocBuilder<HomeCubit, int>(
        builder: (context, state){
          return BottomNavigationBar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            currentIndex: state,
            onTap: (value) => _cubit.changeTabIndex(value),
            items: [
              BottomNavigationBarItem(
                label: "Products",
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: "Carts",
                icon: Icon(Icons.shop)
              ),
              BottomNavigationBarItem(
                label: "Profile",
                icon: Icon(Icons.person)
              ),
            ],
          );
        },
      )
    );
  }
}