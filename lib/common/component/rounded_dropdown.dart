import 'package:flutter/material.dart';

class RoundedDropdown extends StatelessWidget {
  final List<String> items;
  const RoundedDropdown({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(7)),
          border: Border.all(color: const Color(0xffc6c6c6))),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      child: DropdownButton(
        items: [
          for(String item in items)
            DropdownMenuItem(
              child: Text(item),
              value: item,
            ),
        ],
        value: items[0],
        isExpanded: true,
        onChanged: (value) {},
        underline: const SizedBox(),
      ),
    );
  }
}