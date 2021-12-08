import 'package:flutter/material.dart';
import 'package:modu_temp/common/component/header.dart';
import 'package:modu_temp/constant/color.dart';
import 'package:modu_temp/constant/util.dart';
import 'package:modu_temp/home/component/side_calendar.dart';
import 'package:modu_temp/home/component/summary_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late DateTime _selectedDay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Container(
            width: 1000,
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                const Header(isLarge: false,),
                const SizedBox(height: 40,),
                Row(
                  children: [
                    buyersInfo(),
                    const SizedBox(width: 20,),
                    sellersInfo(),
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          const SideCalendar()
        ],
      ),
    );
  }

  Expanded buyersInfo() {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('주요 매출처', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              OutlinedButton(
                onPressed: () {},
                child: const Text('매출처 추가', style: TextStyle(fontSize: 12.0, color: Colors.black)),
                style: OutlinedButton.styleFrom(
                    primary: btnBorderGrey2Color,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    fixedSize: const Size(78, 30)),
              ),
            ],
          ),
          const SizedBox(height: 15),
          SummaryCard(
            logo: 'assets/images/224ECE4952E325910A.png',
            thisSales: priceFormat(21140000000),
            lastSales: 140000000,
            unpaid: 80000000,
            isBuyer: true,
          ),
          const SizedBox(height: 20),
          const SummaryCardSmall(
              logo: 'assets/images/224ECE4952E325910A.png',
              thisSales: 30000000,
              lastSales: 30000000,
              unpaid: 1000000,
              isBuyer: true),
          const SizedBox(height: 20),
          const SummaryCardSmall(
              logo: 'assets/images/224ECE4952E325910A.png',
              thisSales: 30000000,
              lastSales: 30000000,
              unpaid: 1000000,
              isBuyer: true)
        ],
      ),
    );
  }

  Expanded sellersInfo() {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('주요 매입처', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
              OutlinedButton(
                onPressed: () {},
                child: const Text('매입처 추가', style: TextStyle(fontSize: 12.0, color: Colors.black),),
                style: OutlinedButton.styleFrom(
                    primary: btnBorderGrey2Color,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    fixedSize: const Size(78, 30)),
              ),
            ],
          ),
          const SizedBox(height: 15),
          SummaryCard(
              logo: 'assets/images/224ECE4952E325910A.png',
              thisSales: priceFormat(21140000000),
              lastSales: 140000000,
              unpaid: 80000000,
              isBuyer: false),
          const SizedBox(height: 20),
          const SummaryCardSmall(
              logo: 'assets/images/224ECE4952E325910A.png',
              thisSales: 30000000,
              lastSales: 30000000,
              unpaid: 1000000,
              isBuyer: false),
          const SizedBox(height: 20),
          const SummaryCardSmall(
              logo: 'assets/images/224ECE4952E325910A.png',
              thisSales: 30000000,
              lastSales: 30000000,
              unpaid: 1000000,
              isBuyer: false)
        ],
      ),
    );
  }
}