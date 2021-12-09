import 'package:flutter/material.dart';
import 'package:modu_temp/common/component/button.dart';
import 'package:modu_temp/constant/color.dart';
import 'package:modu_temp/specs/component/specs_table.dart';
import 'dart:html' as html;

class SpecsPopupView extends StatelessWidget {
  const SpecsPopupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 1080,
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text('일련번호: 8768600245-2112121004087', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                      Row(
                        children: [
                          SmallButton(title: '저장', press: (){}, width: 110, bgColor: primaryBlueColor),
                          const SizedBox(width: 10,),
                          SmallButton(title: '출력', press: (){}, width: 110, bgColor: primaryBlueColor),
                          const SizedBox(width: 10,),
                          SmallButton(title: '닫기', press: (){
                            html.window.close();
                          }, width: 110, bgColor: primaryBlueColor)
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                SpecsTable(),
                SizedBox(height: 50,),
                SpecsTable()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
