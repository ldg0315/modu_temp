import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final String title;
  final VoidCallback press;
  final double width;
  final Color? textColor;
  final Color bgColor;
  final Color? borderColor;

  const SmallButton({Key? key, required this.title, required this.press, required this.width, this.textColor, required this.bgColor, this.borderColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      child: Text(title, style: TextStyle(color: textColor??Colors.white, fontWeight: FontWeight.bold),),
      style: ElevatedButton.styleFrom(
          fixedSize: Size(width, 50),
          primary: bgColor,
          side: borderColor!=null? BorderSide(width: 1.0, color: borderColor!): null,
          elevation: 0.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
      ),
    );
  }
}

