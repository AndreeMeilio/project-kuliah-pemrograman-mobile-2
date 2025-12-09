import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_routing_practice/config/go_route_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16.0,
              children: [
                Text(
                  "THIS IS HOME PAGE",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    context.push("/${RoutePath.detail}");
                  }, 
                  child: Text(
                    "TO DETAIL PAGE",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ),
                ElevatedButton(
                  onPressed: (){
                    context.push("/${RoutePath.profile}");
                  }, 
                  child: Text(
                    "TO PROFILE PAGE",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}