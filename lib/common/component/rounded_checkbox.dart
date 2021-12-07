import 'package:flutter/material.dart';
import 'package:modu_temp/constant/color.dart';

class RoundedCheckBox extends StatefulWidget {
  bool isChecked;
  final void Function(dynamic) changed;

  RoundedCheckBox({Key? key, required this.isChecked, required this.changed}) : super(key: key);

  @override
  State<RoundedCheckBox> createState() => _RoundedCheckBoxState();
}

class _RoundedCheckBoxState extends State<RoundedCheckBox> {


  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.isChecked,
      onChanged: widget.changed,
      activeColor: primaryBlueColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    );
  }
}
