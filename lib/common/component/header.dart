import 'package:flutter/material.dart';
import 'package:modu_temp/common/component/top_button.dart';
import 'package:modu_temp/constant/color.dart';

class Header extends StatelessWidget {
  final bool isLarge;
  const Header({Key? key, required this.isLarge}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: isLarge?1045:920,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('네이첸', style: TextStyle(color: primaryBlue, fontSize: 34.0, fontWeight: FontWeight.bold),),
          searchField(),
          TopButton(title: '대금처리', press: (){}, color: btnNavy)
        ],
      ),
    );
  }

  Stack searchField() {
    return Stack(
      children: [
        Container(
          width: isLarge?780:650,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.blueAccent, width: 3),
              borderRadius: BorderRadius.circular(7)),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: isLarge?690:560,
              height: 50,
              child: const TextField(
                decoration: InputDecoration(
                    hintText: '거래처명/담당자명/주요품목을 입력하세요.',
                    focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide.none),
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