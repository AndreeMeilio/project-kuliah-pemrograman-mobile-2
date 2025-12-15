import 'package:flutter/material.dart';

class ExplicitAnimationPage extends StatefulWidget {
  const ExplicitAnimationPage({super.key});

  @override
  State<ExplicitAnimationPage> createState() => _ExplicitAnimationPageState();
}

class _ExplicitAnimationPageState extends State<ExplicitAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explicit Animation", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 24.0,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ExplicitLoadingAnimationSectionWidget(),
                ExplicitColorAnimationSectionWidget(),
                SizedBox(height: 24.0,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExplicitLoadingAnimationSectionWidget extends StatefulWidget {
  const ExplicitLoadingAnimationSectionWidget({super.key});

  @override
  State<ExplicitLoadingAnimationSectionWidget> createState() => _ExplicitLoadingAnimationSectionWidgetState();
}

class _ExplicitLoadingAnimationSectionWidgetState extends State<ExplicitLoadingAnimationSectionWidget> with TickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    
    _animationController.repeat();
  }

  @override
  void dispose() {
    super.dispose();

    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation, 
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: Container(
            width: 200.0,
            height: 200.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue, width: 2),
              color: Colors.transparent
            ),
          ),
        );
      },
    );
  }
}

class ExplicitColorAnimationSectionWidget extends StatefulWidget {
  const ExplicitColorAnimationSectionWidget({super.key});

  @override
  State<ExplicitColorAnimationSectionWidget> createState() => _ExplicitColorAnimationSectionWidgetState();
}

class _ExplicitColorAnimationSectionWidgetState extends State<ExplicitColorAnimationSectionWidget> with TickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this
    );

    _animation = ColorTween(
      begin: Colors.green,
      end: Colors.blue
    ).animate(_animationController);
    
    _animationController.repeat();
  }

  @override
  void dispose() {
    super.dispose();

    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation, 
      builder: (context, child) {
        return Container(
          width: 200.0,
          height: 200.0,
          color: _animation.value,
          child: Center(
            child: Text("Color Tween", textAlign: TextAlign.center,),
          ),
        );
      },
    );
  }
}