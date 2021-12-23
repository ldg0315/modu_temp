import 'package:flutter/material.dart';
import 'package:modu_temp/constant/color.dart';

class PasswordField extends StatelessWidget {
  final String title;
  final String hint;
  final Color fillColor;
  final Color borderColor;
  final TextEditingController controller;
  const PasswordField({Key? key, required this.title, required this.hint, required this.fillColor, required this.borderColor, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
          const SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
              labelText: hint,
              fillColor: fillColor,
              filled: true,
              floatingLabelStyle: const TextStyle(color: primaryBlueColor),
              border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)), borderSide: BorderSide(color: borderColor)),
              focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)), borderSide: BorderSide(color: primaryBlueColor, width: 2)),
            ),
            obscureText: true,
            controller: controller,
          )
        ],
      ),
    );
  }
}