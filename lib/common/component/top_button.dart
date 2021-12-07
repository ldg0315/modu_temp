import 'package:flutter/material.dart';

class TopButton extends StatelessWidget {
  final String title;
  final VoidCallback press;
  final Color? color;

  const TopButton(
      {Key? key, required this.title, required this.press, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      child: Text(title),
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(130, 50),
        primary: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))
      ),
    );
  }
}
