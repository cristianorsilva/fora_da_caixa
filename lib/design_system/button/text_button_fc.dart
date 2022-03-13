import 'package:flutter/material.dart';

class TextButtonFC extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;

  const TextButtonFC({Key? key, required this.onPressed, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        key: key,
        onPressed: onPressed,
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple)),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.only(left: 50, right: 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ));
  }
}
