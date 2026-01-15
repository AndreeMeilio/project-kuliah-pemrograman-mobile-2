
import 'package:core/component/miscellaneous/loading_component.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class GenericPage extends StatelessWidget {
  const GenericPage({
    super.key,
    required this.child
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: child,
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: LoadingComponent(),
        ),
      ],
    );
  }
}