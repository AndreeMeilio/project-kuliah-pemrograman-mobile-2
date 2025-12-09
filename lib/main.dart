import 'package:flutter/material.dart';
import 'package:navigation_routing_practice/config/go_route_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routeConfig(),
    );
  }
}