import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  VoidCallback onpressed;
  final String text;
  MyButton({super.key, required this.onpressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}
