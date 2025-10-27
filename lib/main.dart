import 'package:flutter/material.dart';
import 'package:movies_app_pertemuan_5_assignment/pages/home_page.dart';

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
      ),
      home: Scaffold(
        body: const HomePage(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF595959),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white38,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.music_note), label: "Genres"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
          ],
        ),
      )
    );
  }
}
