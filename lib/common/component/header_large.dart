import 'package:flutter/material.dart';
import 'package:modu_temp/common/component/top_button.dart';
import 'package:modu_temp/constant/color.dart';

class HeaderLarge extends StatelessWidget {
  const HeaderLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1060,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('네이첸', style: TextStyle(color: primaryBlue, fontSize: 35.0, fontWeight: FontWeight.bold),),
          _searchField(),
          TopButton(title: '대금처리', press: (){}, color: btnNavy)
        ],
      ),
    );
  }

  Stack _searchField() {
    return Stack(
      children: [
        Container(
          width: 780,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: primaryBlue, width: 3),
              borderRadius: BorderRadius.circular(7)),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 690,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                    hintText: '거래처명/담당자명/주요품목을 입력하세요.',
                    hintStyle: TextStyle(color: hintTextGrey.withOpacity(0.5)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
            InkWell(
              child: Container(
                decoration: const BoxDecoration(
                    color: primaryBlue,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                width: 90,
                height: 50,
                alignment: Alignment.center,
                child: const Text(
                  '검색',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () {},
            )
          ],
        ),
      ],
    );
  }
}