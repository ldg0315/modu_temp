import 'package:flutter/material.dart';
import 'package:modu_temp/constant/color.dart';
import 'package:modu_temp/constant/text_style.dart';

class SummaryCard extends StatelessWidget {
  final String logo;
  final String thisSales;
  final int lastSales;
  final int unpaid;
  final bool isBuyer;

  const SummaryCard({Key? key, required this.logo, required this.thisSales, required this.lastSales, required this.unpaid, required this.isBuyer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(child: Image.asset(logo), width: 100, height: 40,),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isBuyer?Text('이번달 매출액', style: greyBold,):Text('이번달 매입액', style: greyBold,),
              Text('$thisSales 원', style: bold18)
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isBuyer?Text('지난달 매출액', style: greyBold):Text('지난달 매입액', style: greyBold),
              Text('$lastSales 원', style: bold18)
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isBuyer?Text('미수금', style: greyBold.copyWith(color: Colors.pink)):Text('미지급금', style: greyBold.copyWith(color: Colors.pink)),
              Text('$unpaid 원', style: bold18.copyWith(color: Colors.pink))
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('미확인', style: greyBold),
                  Row(
                    children: [
                      Text('(', style: greyBold),
                      Text('수신', style: TextStyle(color: primaryBlueColor, fontWeight: FontWeight.bold),),
                      Text(' | ', style: greyBold),
                      Text('발신', style: TextStyle(color: textOrangeColor, fontWeight: FontWeight.bold),),
                      Text(')', style: greyBold)
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  UncheckedElement(title: '발주서', received: 10, sent: 1,),
                  UncheckedElement(title: '견적서', received: 3, sent: 7),
                  UncheckedElement(title: '거래명세서', received: 6, sent: 8)
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SummaryCardSmall extends StatelessWidget {
  final String logo;
  final int thisSales;
  final int lastSales;
  final int unpaid;
  final bool isBuyer;

  const SummaryCardSmall({Key? key, required this.logo, required this.thisSales, required this.lastSales, required this.unpaid, required this.isBuyer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(child: Image.asset(logo), width: 100, height: 40,),
              IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_up))
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isBuyer?Text('이번달 매출액', style: greyBold,):Text('이번달 매입액', style: greyBold,),
              Text('$thisSales 원', style: bold18)
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isBuyer?Text('지난달 매출액', style: greyBold):Text('지난달 매입액', style: greyBold,),
              Text('$lastSales 원', style: bold18)
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isBuyer?Text('미수금', style: greyBold):Text('미지급금', style: greyBold),
              Text('$unpaid 원', style: bold18)
            ],
          )
        ],
      ),
    );
  }
}



class UncheckedElement extends StatelessWidget {
  final String title;
  final int received;
  final int sent;
  const UncheckedElement({Key? key, required this.title, required this.received, required this.sent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 65,
      decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border.all(color: lightGreyColor)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),),
          SizedBox(height:3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$received', style: TextStyle(color: primaryBlueColor, fontWeight: FontWeight.bold),),
              Text(' | '),
              Text('$sent', style: TextStyle(color: Color(0xffee6d00), fontWeight: FontWeight.bold),)
            ],
          )
        ],
      ),
    );
  }
}