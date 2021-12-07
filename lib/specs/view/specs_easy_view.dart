import 'package:flutter/material.dart';
import 'package:modu_temp/common/component/header.dart';
import 'package:modu_temp/constant/color.dart';
import 'package:modu_temp/constant/text_style.dart';
import 'package:modu_temp/specs/component/bottom_buttons.dart';
import 'package:modu_temp/specs/component/specs_easy/specs_table.dart';
import 'package:modu_temp/specs/component/specs_easy/top_info_row.dart';

class SpecsEasyView extends StatefulWidget {
  const SpecsEasyView({Key? key}) : super(key: key);

  @override
  State<SpecsEasyView> createState() => _SpecsEasyViewState();
}

class _SpecsEasyViewState extends State<SpecsEasyView> {
  late bool isOpen;
  final List<String> _titles = ['상품명', '상품코드', '상세내용', '규격', '수량', '단가', '공급가액', '세액', '삭제'];
  final List<List<dynamic>> _contents = [];
  late List<bool> _isSelected = [];


  @override
  void initState() {
    super.initState();
    isOpen = false;
  //임시
    for(int i=0;i<5;i++){
      _contents.add(['3연동 자동중문', 'PTG1235778', '반촌현장', '1200*800', 1, 22200000, 22200000, 220000, '삭제']);
      _isSelected.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(40),
      child: GestureDetector(
        onTap: (){
          setState(() {
            _isSelected = [false, false, false, false, false];
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(isLarge: true,),
            const SizedBox(height: 20,),
            Container(
              width: 1045,
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      Text('거래명세서', style: TextStyle(color: hintTextGrey.withOpacity(0.8), fontSize: 40, fontWeight: FontWeight.bold),),
                      Text('(공급받는자 보관용)', style: TextStyle(color: hintTextGrey.withOpacity(0.5), fontWeight: FontWeight.bold),)
                    ],
                  ),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      TopInfoRow(title: '거래처명', content: '한국안전관리공사',),
                      TopInfoRow(title: '거래일', content: '2021년 11월 20일',),
                      TopInfoRow(title: '인수자', content: '최명숙',),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  SpecsTable(titles: _titles, contents: _contents, isSelected: _isSelected,),
                  const SizedBox(height: 10,),
                  buildStack(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const BottomButtons()
          ],
        ),
      ),
    );
  }

  Stack buildStack() {
    return Stack(
      children: [
        Column(
          children: [
            totalAmountContainer(),
            companyInfo(),
          ],
        ),
        if (isOpen) sumContainer(),
        openButton()
      ],
    );
  }

  Stack totalAmountContainer() {
    return Stack(
      children: [
        const SizedBox(width: 960, height: 95),
        Container(
          width: 960,
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: primaryBlue
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('총 금액', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              const Spacer(),
              Text('칠백칠십오만삼천구백원', style: TextStyle(color: Colors.white.withOpacity(0.5), fontWeight: FontWeight.bold),),
              const SizedBox(width: 15),
              const Text('7,753,900원', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),)
            ],
          ),
        ),
      ],
    );
  }

  Container companyInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: 620,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('(주)네이첸', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('대표', style: smallTitle),
                Text('홍길동', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('업태/종목', style: smallTitle),
                Text('도소매/도어,몰딩', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('전화번호', style: smallTitle ),
                Text('052-256-8907', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('사업자등록번호', style: smallTitle),
                Text('87608-60-000245', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('주소', style: smallTitle),
                Text('울산광역시 울주군 뭉촌면 고연공단1길 130', style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Positioned sumContainer() {
    return Positioned(
      bottom: 15,
      child: Container(
        width: 960,
        height: 150,
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          color: btnGrey,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('전 잔금', style: smallTitle),
                Text('10,000,000', style: smallTitle.copyWith(fontSize: 19.0))
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('입금', style: smallTitle),
                Text('0', style: smallTitle.copyWith(fontSize: 19.0))
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('잔금', style: smallTitle),
                Text('5,000,000', style: smallTitle.copyWith(fontSize: 19.0))
              ],
            )
          ],
        ),
      ),
    );
  }

  Positioned openButton() {
    return Positioned(
      child: InkWell(
        onTap: () {
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 3))
              ]),
          child: isOpen
              ? const Icon(Icons.keyboard_arrow_up_outlined)
              : const Icon(Icons.keyboard_arrow_down_outlined),
        ),
      ),
      bottom: isOpen ? 0 : 145,
      left: 465,
    );
  }

}

