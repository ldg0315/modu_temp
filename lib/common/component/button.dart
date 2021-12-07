import 'package:flutter/material.dart';
import 'package:modu_temp/constant/color.dart';

class SmallButton extends StatelessWidget {
  final String title;
  final VoidCallback press;

  const SmallButton({Key? key, required this.title, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      child: Text(title, style: const TextStyle(color: smallTitleBlueColor, fontWeight: FontWeight.bold),),
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(140, 50),
          primary: btnGreyColor,
          side: const BorderSide(width: 1.0, color: Colors.black12),
          elevation: 0.0
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback press;

  const RoundedButton({Key? key, required this.title, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      child: Text(title, style: const TextStyle(color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.bold)),
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(135, 35),
          primary: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: const BorderSide(color: btnBorderGreyColor)
          ),
          elevation: 0.0
        // side: const BorderSide(width: 1.0, color: primaryBlue)
      ),
    );
  }
}
