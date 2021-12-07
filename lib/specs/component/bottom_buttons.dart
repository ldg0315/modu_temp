import 'package:flutter/material.dart';
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
              OutlinedButton(
                onPressed: (){},
                child: const Text('초기화하기', style: TextStyle(color: hintTextGreyColor, fontWeight: FontWeight.bold),),
                style: OutlinedButton.styleFrom(
                    primary: btnBorderGreyColor,
                    fixedSize: const Size(140, 50),
                    backgroundColor: Colors.white
                ),
              ),
              const SizedBox(width: 5),
              OutlinedButton(
                onPressed: (){
                  context.read<SpecsMode>().changeMode();
                },
                child: context.watch<SpecsMode>().isClassic
                    ? const Text('이지모드', style: TextStyle(color: primaryBlueColor, fontWeight: FontWeight.bold))
                    : const Text('클래식모드', style: TextStyle(color: primaryBlueColor, fontWeight: FontWeight.bold))
                ,
                style: OutlinedButton.styleFrom(
                    primary: btnBorderGreyColor,
                    fixedSize: const Size(140, 50),
                    backgroundColor: Colors.white
                ),
              ),
            ],
          ),
          OutlinedButton(
            onPressed: (){},
            child: const Text('전송하기', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            style: OutlinedButton.styleFrom(
                primary: primaryBlueColor,
                fixedSize: const Size(280, 50),
                backgroundColor: primaryBlueColor
            ),
          )
        ],
      ),
    );
  }
}
