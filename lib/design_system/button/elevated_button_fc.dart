import 'package:flutter/material.dart';

class ElevatedButtonFC extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;

  const ElevatedButtonFC({Key? key, required this.onPressed, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        key: key,
        onPressed: onPressed,
        child: Text(label),
        style: ElevatedButton.styleFrom(
          primary: Colors.deepPurple,
          padding: const EdgeInsets.only(left: 50, right: 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ));
  }
}
