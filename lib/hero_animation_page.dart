import 'package:flutter/material.dart';

class HeroAnimationPage extends StatefulWidget {
  const HeroAnimationPage({super.key});

  @override
  State<HeroAnimationPage> createState() => _HeroAnimationPageState();
}

class _HeroAnimationPageState extends State<HeroAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explicit Animation", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
      ),
      body: SafeArea(
        child: Hero(
          tag: "testingAnimationHeroImage", 
          child: Image.asset("assets/cat.jpg", fit: BoxFit.fill,)
        ),
      ),
    );
  }
}