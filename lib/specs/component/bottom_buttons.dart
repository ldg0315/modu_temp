import 'package:flutter/material.dart';
import 'package:modu_temp/common/component/button.dart';
import 'package:modu_temp/common/provider/specs_mode_provider.dart';
import 'package:modu_temp/constant/color.dart';
import 'package:provider/provider.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1040,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonBar(
            buttonPadding: EdgeInsets.zero,
            children: [
              SmallButton(title: '초기화하기', press: (){}, width: 140, bgColor: Colors.white, textColor: hintTextGreyColor, borderColor: btnBorderGreyColor,),
              const SizedBox(width: 5),
              context.watch<SpecsMode>().isClassic
              ? SmallButton(title: '이지모드', press: (){context.read<SpecsMode>().changeMode();}, width: 140, bgColor:Colors.white, textColor: primaryBlueColor, borderColor: btnBorderGreyColor,)
              : SmallButton(title: '클래식모드', press: (){context.read<SpecsMode>().changeMode();}, width: 140, bgColor:Colors.white, textColor: primaryBlueColor, borderColor: btnBorderGreyColor,)
            ],
          ),
          SmallButton(title: '전송하기', press: (){}, width: 280, bgColor: primaryBlueColor,),
        ],
      ),
    );
  }
}
