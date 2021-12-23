import 'package:flutter/material.dart';
import 'package:modu_temp/constant/color.dart';
import 'package:modu_temp/constant/util.dart';
import 'package:modu_temp/table_calendar/table_calendar.dart';


class SideCalendar extends StatefulWidget {
  const SideCalendar({Key? key}) : super(key: key);

  @override
  _SideCalendarState createState() => _SideCalendarState();
}

class _SideCalendarState extends State<SideCalendar> {
  late DateTime selectedDay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            border: Border(left: BorderSide(color: lightGreyColor)),
            color: Colors.white),
        child: Column(
          children: [
            OutlinedButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.calendar_today_outlined, color: Colors.black, size: 16.0),
              label: const Text('일정 추가하기', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              style: OutlinedButton.styleFrom(
                  primary: btnBorderGrey2Color,
                  fixedSize: const Size(250, 50),
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                  backgroundColor: const Color(0xfffbfbfb)
              ),
            ),
            const SizedBox(height: 10),
            Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Column(
                    children: [
                      Container(width: 260, height: 37, color: const Color(0xfff8f8f8)),
                      Container(width: 260, height: 170, color: btnBorderGrey2Color),
                    ],
                  ),
                ),
                buildTableCalendar(),
              ],
            ),
            const SizedBox(height: 20,),
            DailyInfo(date: DateTime.utc(2021, 11, 23)),
            DailyInfo(date: DateTime.utc(2021, 11, 22)),
            DailyInfo(date: DateTime.utc(2021, 11, 21))
          ],
        ),
      ),
    );
  }

  TableCalendar<dynamic> buildTableCalendar() {
    return TableCalendar(
      firstDay: DateTime.utc(2021, 1, 1),
      lastDay: DateTime.utc(2022, 12, 31),
      focusedDay: selectedDay,
      rowHeight: 35,
      headerStyle: HeaderStyle(
        titleTextFormatter: (DateTime date, _) => '${date.year}.${date.month}',
        titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2.0, fontSize: 16.0),
        formatButtonVisible: false,
        titleCentered: true,
        leftChevronPadding: const EdgeInsets.all(3),
        leftChevronMargin: EdgeInsets.zero,
        rightChevronMargin: EdgeInsets.zero,
        rightChevronPadding: const EdgeInsets.all(3),
      ),
      locale: 'ko_KR',
      daysOfWeekHeight: 30,
      onDaySelected: (newDay, focusedDay) {
        setState(() {
          selectedDay = newDay;
        });
      },
      selectedDayPredicate: (day) => isSameDay(day, selectedDay),
      calendarStyle: const CalendarStyle(
          isTodayHighlighted: false,
          selectedDecoration: BoxDecoration(color: primaryBlueColor)),
    );
  }
}

class DailyItem extends StatelessWidget {
  final String companyName;
  final String detail;
  final int amount;
  final bool isSell;
  const DailyItem({Key? key, required this.companyName, required this.detail, required this.amount, required this.isSell}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                child: isSell?const Icon(Icons.arrow_forward, color: Colors.white,):const Icon(Icons.arrow_back, color: Colors.white,),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: isSell?primaryBlueColor:textOrangeColor),
              ),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(companyName, style: const TextStyle(fontWeight: FontWeight.bold),),
                  Text(detail, style: const TextStyle(fontSize: 13.0),)
                ],
              ),
            ],
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.centerRight,
            child: Text('${priceFormat.format(amount)}원', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16,),),
          )
        ],
      ),
    );
  }
}

class DailyInfo extends StatelessWidget {
  final DateTime date;
  const DailyInfo({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${date.month}월 ${date.day}일', style: TextStyle(color: Colors.grey[700]),),
        const Divider(),
        const DailyItem(companyName: 'GS건설', detail: '3연동자동문 외 5건', amount: 129900000, isSell: true,),
        const DailyItem(companyName: 'GS건설', detail: '3연동자동문 외 5건', amount: 129900000, isSell: false,),
        const DailyItem(companyName: 'GS건설', detail: '3연동자동문 외 5건', amount: 129900000, isSell: false,),
        const DailyItem(companyName: 'GS건설', detail: '3연동자동문 외 5건', amount: 129900000, isSell: true,),
      ],
    );
  }
}
