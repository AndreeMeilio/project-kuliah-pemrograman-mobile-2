import 'package:flutter/material.dart';

class ImplicitAnimationPage extends StatefulWidget {
  const ImplicitAnimationPage({super.key});

  @override
  State<ImplicitAnimationPage> createState() => _ImplicitAnimationPageState();
}

class _ImplicitAnimationPageState extends State<ImplicitAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Implicit Animation", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 24.0,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AnimatedContainerSectionWidget(),
                AnimatedOpacitySectionWidget(),
                AnimatedPositionedSectionWidget(),
                AnimatedScaleSectionWidget(),
                AnimatedRotationSectionWidget(),
                AnimatedCustomSectionWidget(),
                SizedBox(height: 24.0,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedContainerSectionWidget extends StatefulWidget {
  const AnimatedContainerSectionWidget({super.key});

  @override
  State<AnimatedContainerSectionWidget> createState() => _AnimatedContainerSectionWidgetState();
}

class _AnimatedContainerSectionWidgetState extends State<AnimatedContainerSectionWidget> {

  late bool _isExpanded;

  @override
  void initState() {
    super.initState();

    _isExpanded = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.0,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Animated Container",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: _isExpanded ? 250.0 : 200.0,
          width: _isExpanded ? 250.0 : 200.0,
          decoration: BoxDecoration(
            color: _isExpanded ? Colors.green : Colors.blue,
            borderRadius: _isExpanded ? BorderRadius.circular(15.0) : BorderRadius.circular(5.0) 
          ),
          child: Center(
            child: Text(
              _isExpanded ? "Expanding" : "Not Expending"
            ),
          )
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: ElevatedButton(
            onPressed: (){
              setState(() {
                _isExpanded = !_isExpanded;
              });
            }, 
            child: Text("Change State")
          ),
        )
      ],
    );
  }
}

class AnimatedOpacitySectionWidget extends StatefulWidget {
  const AnimatedOpacitySectionWidget({super.key});

  @override
  State<AnimatedOpacitySectionWidget> createState() => _AnimatedOpacitySectionWidgetState();
}

class _AnimatedOpacitySectionWidgetState extends State<AnimatedOpacitySectionWidget> {
  late bool _isVisible;

  @override
  void initState() {
    super.initState();

    _isVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.0,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Animated Opacity",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0.0, 
          duration: const Duration(milliseconds: 500),
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.blue,
            child: Center(
              child: Text(
                _isVisible ? "Visible" : "Not Visible"
              ),
            ),
          )
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: ElevatedButton(
            onPressed: (){
              setState(() {
                _isVisible = !_isVisible;
              });
            }, 
            child: Text("Change State")
          ),
        )
      ],
    );
  }
}

class AnimatedPositionedSectionWidget extends StatefulWidget {
  const AnimatedPositionedSectionWidget({super.key});

  @override
  State<AnimatedPositionedSectionWidget> createState() => _AnimatedPositionedSectionWidgetState();
}

class _AnimatedPositionedSectionWidgetState extends State<AnimatedPositionedSectionWidget> {
  late bool _haveMarginLeft;

  @override
  void initState() {
    super.initState();

    _haveMarginLeft = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.0,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Animated Positioned",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        Container(
          color: Colors.green,
          width: 200.0,
          height: 200.0,
          child: Stack(
            alignment: AlignmentGeometry.centerLeft,
            children: [
              AnimatedPositioned(
                left: _haveMarginLeft ? 65.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Container(
                  width: 75.0,
                  height: 75.0,
                  decoration: BoxDecoration(
                    color: Colors.blue
                  ),
                  child: Center(
                    child: Text("Animated Positioned", textAlign: TextAlign.center,),
                  ),
                ), 
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: ElevatedButton(
            onPressed: (){
              setState(() {
                _haveMarginLeft = !_haveMarginLeft;
              });
            }, 
            child: Text("Change State")
          ),
        )
      ],
    );
  }
}

class AnimatedScaleSectionWidget extends StatefulWidget {
  const AnimatedScaleSectionWidget({super.key});

  @override
  State<AnimatedScaleSectionWidget> createState() => _AnimatedScaleSectionWidgetState();
}

class _AnimatedScaleSectionWidgetState extends State<AnimatedScaleSectionWidget> {
  late bool _isLarge;

  @override
  void initState() {
    super.initState();

    _isLarge = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.0,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Animated Scale",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        AnimatedScale(
          scale: _isLarge ? 1.0 : 0.5, 
          duration: const Duration(milliseconds: 500),
          child: Container(
            color: Colors.blue,
            width: 200.0,
            height: 200.0,
            child: Center(
              child: Text("Animated Scale", textAlign: TextAlign.center,),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: ElevatedButton(
            onPressed: (){
              setState(() {
                _isLarge = !_isLarge;
              });
            }, 
            child: Text("Change State")
          ),
        )
      ],
    );
  }
}

class AnimatedRotationSectionWidget extends StatefulWidget {
  const AnimatedRotationSectionWidget({super.key});

  @override
  State<AnimatedRotationSectionWidget> createState() => _AnimatedRotationSectionWidgetState();
}

class _AnimatedRotationSectionWidgetState extends State<AnimatedRotationSectionWidget> {
  late bool _isRotated;

  @override
  void initState() {
    super.initState();

    _isRotated = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.0,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Animated Scale",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        AnimatedRotation(
          turns: _isRotated ? 1.5 : 0.0, 
          duration: const Duration(milliseconds: 500),
          child: Container(
            color: Colors.blue,
            width: 200.0,
            height: 200.0,
            child: Center(
              child: Text("Animated Rotation", textAlign: TextAlign.center,),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: ElevatedButton(
            onPressed: (){
              setState(() {
                _isRotated = !_isRotated;
              });
            }, 
            child: Text("Change State")
          ),
        )
      ],
    );
  }
}

class AnimatedCustomSectionWidget extends StatefulWidget {
  const AnimatedCustomSectionWidget({super.key});

  @override
  State<AnimatedCustomSectionWidget> createState() => _AnimatedCustomSectionWidgetState();
}

class _AnimatedCustomSectionWidgetState extends State<AnimatedCustomSectionWidget> {
  late double _targetValue;

  @override
  void initState() {
    super.initState();

    _targetValue = 0.5;
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.0,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Animated Scale",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        TweenAnimationBuilder<double>(
          tween: Tween(
            begin: 0,
            end: _targetValue
          ), 
          duration: const Duration(milliseconds: 500), 
          curve: Curves.easeInOut,
          builder: (context, value, child) {
            return Transform.scale(
              scale: value,
              child: Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text("Animation Custom", textAlign: TextAlign.center,),
                ),
              )
            );
          },
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: ElevatedButton(
            onPressed: (){
              setState(() {
                _targetValue += 0.2;
              });
            }, 
            child: Text("Change State")
          ),
        )
      ],
    );
  }
}