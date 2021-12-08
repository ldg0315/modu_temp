import 'package:flutter/material.dart';
import 'package:modu_temp/common/component/header.dart';
import 'package:modu_temp/specs/component/bottom_buttons.dart';
import 'package:modu_temp/specs/component/specs_table.dart';

class SpecsClassicView extends StatelessWidget {
  const SpecsClassicView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(isLarge: true,),
          const SizedBox(height: 20),
          Container(
            width: 1045,
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: SpecsTable()
          ),
          const SizedBox(height: 20),
          BottomButtons()
        ],
      ),
    );
  }


}


