import 'package:flutter/material.dart';
import 'package:modu_temp/constant/color.dart';

Row imageAndCodeRow() {
  return Row(
    children: [
      Expanded(
        child: imageColumn(),
      ),
      const SizedBox(width: 20),
      Expanded(
        child: codeColumn(),
      ),
    ],
  );
}

Column imageColumn() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('상품이미지', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
              const SizedBox(width: 5,),
              Text('300x300 사이즈에 최적화되어있습니다.', style: TextStyle(fontSize: 12.0, color: primaryBlueColor.withOpacity(0.49))),
            ],
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('파일선택', style: TextStyle(color: Colors.black)),
            style: OutlinedButton.styleFrom(
                primary: Colors.white,
                fixedSize: const Size(70, 30),
                backgroundColor: const Color(0xfffafafa),
                padding: EdgeInsets.zero
            ),
          )
        ],
      ),
      const SizedBox(height: 10),
      Container(
        height: 200,
        decoration: BoxDecoration(
            color: Colors.grey[100],
            border: Border.all(color: lightGreyColor),
            borderRadius: const BorderRadius.all(Radius.circular(7))),
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                    child: Image.network('http://img1.tmon.kr/cdn3/deals/2019/08/09/2330733854/2330733854_front_520dd81587.jpg', fit: BoxFit.cover,),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 170,
                  height: 170,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                ),
                Positioned(
                  child: OutlinedButton(
                    child: const Text('삭제'),
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        primary: const Color(0xffcf0000),
                        fixedSize: const Size(40, 30),
                        side: const BorderSide(color: Color(0xffcf0000)),
                        padding: EdgeInsets.zero
                    ),
                  ),
                  bottom: 20,
                  right: 20,
                ),
              ],
            ),
          ],
        ),
      )
    ],
  );
}

Column codeColumn() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('상품코드', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
              const SizedBox(width: 5,),
              Text('거래처 주문 화면의 해당 상품 목록에 내용이 보여집니다.', style: TextStyle(fontSize: 12.0, color: primaryBlueColor.withOpacity(0.49)),),
            ],
          ),
        ],
      ),
      const SizedBox(height: 20),
      Container(
        height: 200,
        decoration: BoxDecoration(
            color: innerCellBlueColor,
            border: Border.all(color: lightGreyColor),
            borderRadius: const BorderRadius.all(Radius.circular(7))),
        child: const TextField(
          maxLines: 20,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintText: '기타 상품에 대한 공지사항을 입력해주세요.'
          ),
        ),
      )
    ],
  );
}