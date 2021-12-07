import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:modu_temp/common/component/input_column.dart';
import 'package:modu_temp/common/component/rounded_checkbox.dart';
import 'package:modu_temp/common/component/rounded_dropdown.dart';
import 'package:modu_temp/common/component/top_button.dart';
import 'package:modu_temp/constant/color.dart';

import '../component/image_and_product_code.dart';

class NewProductView extends StatefulWidget {
  const NewProductView({Key? key}) : super(key: key);

  @override
  State<NewProductView> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductView> {
  late bool _isUse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isUse = true;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 1040,
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              topRow(),
              const SizedBox(height: 30),
              Container(
                child: const Text('기본정보', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(height: 20),
              buildContainer()
            ],
          ),
        ),
        const Spacer()
      ],
    );
  }

  Container buildContainer() {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              InputColumn(title: '상품코드', hint: '상품코드를 입력하세요.', fillColor: innerCellBlueColor, borderColor: tradeBorderGreyColor),
              SizedBox(width: 20),
              InputColumn(title: '상품명', hint: '상품명을 입력하세요.', fillColor: innerCellBlueColor, borderColor: tradeBorderGreyColor)
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('기존에 쓰시는 ERP 상품코드를 입력하세요. 없으면 입력하지 않아도 됩니다.\n상품코드는 한/영 최대 30자까지 입력가능합니다.',
                style: TextStyle(color: primaryBlueColor.withOpacity(0.5), fontSize: 11.0),
              ),
              const SizedBox(width: 87,),
              Text('거래명세표 출력 유형에 따라 최소 30자, 최대 50자까지 표시됩니다.',
                  style: TextStyle(color: primaryBlueColor.withOpacity(0.5), fontSize: 11.0)
              )
            ],
          ),
          const SizedBox(height: 30),
          categoryColumn(),
          const SizedBox(height: 30),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const InputColumn(title: '제조사', hint: '예: 네이첸', fillColor: innerCellBlueColor, borderColor: tradeBorderGreyColor),
            const SizedBox(width: 20),
            countryColumn()
          ]),
          const SizedBox(height: 30),
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const InputColumn(title: '규격', hint: '예: 몰딩 그레이 100', fillColor: innerCellBlueColor, borderColor: tradeBorderGreyColor),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('최소 주문 수량', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                      const SizedBox(height: 10),
                      amountRow(),
                    ],
                  ),
                )
              ]),
          const SizedBox(height: 30),
          imageAndCodeRow()
        ],
      ),
    );
  }

  Row topRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('네이첸', style: TextStyle(color: primaryBlueColor, fontSize: 28, fontWeight: FontWeight.w900),),
        Row(
          children: [
            TopButton(title: '상품리스트', color: primaryBlueColor, press: () {},),
            const SizedBox(width: 10),
            TopButton(title: '상품등록', color: primaryBlueColor, press: () {},),
            const SizedBox(width: 10),
            TopButton(title: '대금처리', color: btnNavyColor, press: () {},),
          ],
        ),
      ],
    );
  }

  Column categoryColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('분류', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
            ElevatedButton(
              onPressed: () {
                html.window.open('http://localhost:528/#/', '_blank', 'location=yes,height=570,width=520,scrollbars=yes,status=yes');
              },
              child: const Text('상품 분류표'),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  primary: primaryBlueColor,
                  padding: const EdgeInsets.symmetric(horizontal: 8)),
            )
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: const [
            Text('대분류', style: TextStyle(color: Colors.grey)),
            SizedBox(width: 10),
            Expanded(child: RoundedDropdown(items: ['3연동 중문', 'AAA'])),
            SizedBox(width: 10),
            Text('중분류', style: TextStyle(color: Colors.grey)),
            SizedBox(width: 10),
            Expanded(child: RoundedDropdown(items: ['초슬림 3연동 중문', 'BBB'])),
            SizedBox(width: 10),
            Text('소분류', style: TextStyle(color: Colors.grey)),
            SizedBox(width: 10),
            Expanded(child: RoundedDropdown(items: ['그레이', '블랙']))
          ],
        )
      ],
    );
  }

  Row amountRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RoundedCheckBox(
          isChecked: _isUse,
          changed: (value) {
            setState(() {
              _isUse = value!;
            });
          },
        ),
        const Text('미사용'),
        RoundedCheckBox(
          isChecked: !_isUse,
          changed: (value) {
            setState(() {
              _isUse = !value!;
            });
          },
        ),
        const Text('사용'),
        const SizedBox(width: 20),
        const Expanded(
          child: TextField(
            decoration: InputDecoration(
              labelText: '10',
              fillColor: innerCellBlueColor,
              filled: true,
              floatingLabelStyle: TextStyle(color: primaryBlueColor),
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  borderSide: BorderSide(color: lightGreyColor)),
            ),
            //controller: controller,
          ),
        ),
      ],
    );
  }

  Expanded countryColumn() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('제조국가', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
          SizedBox(height: 10),
          RoundedDropdown(items: ['대한민국', '러시아', '미국'])
        ],
      ),
    );
  }
}