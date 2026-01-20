
import 'package:flutter/material.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    required this.initialValue,
    required this.onChanged,
    required this.items,
    this.width
  });

  final T initialValue;
  final void Function(T?)? onChanged;
  final List<DropdownMenuItem<T>> items;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onPrimary,
      width: width,
      child: DropdownButtonFormField<T>(
        initialValue: initialValue,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0, 
            vertical: 8.0
          ),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)
          ),
          focusColor: Theme.of(context).colorScheme.primary,
          isDense: true
        ),
        items: items,
        onChanged: onChanged
      ),
    );
  }
}