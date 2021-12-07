import 'package:flutter/material.dart';
import 'package:modu_temp/constant/text_style.dart';

class TopInfoRow extends StatelessWidget {
  final String title;
  final String content;
  const TopInfoRow({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 307,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: smallTitle,),
          Container(
            child: Text(content, style: const TextStyle(fontWeight: FontWeight.bold),),
            color: const Color(0xfffbfbfb),
            width: 210,
            height: 50,
            padding: const EdgeInsets.all(15),
          ),
        ],
      ),
    );
  }
}
