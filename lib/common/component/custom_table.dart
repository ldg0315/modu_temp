import 'package:flutter/material.dart';
import 'package:modu_temp/constant/color.dart';

class CustomTable extends StatelessWidget {
  final List<double> widths;
  final List<String> title;
  final List<TableRow> contents;
  const CustomTable({Key? key, required this.widths, required this.title, required this.contents}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Map<int, FixedColumnWidth> _widths = {};

    for(int i=0;i<widths.length;i++){
      _widths[i] = FixedColumnWidth(widths[i]);
    }

    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: _widths,
      children:
      [
        TableRow(
          children: title.map((e) => Text(e)).toList(),
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: lightGreyColor))),
        ),
        for(int i=0;i<contents.length;i++)
          contents[i]
      ]
    );
  }
}

class Sample extends StatelessWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTable(
        widths: [150,150,200],
        title: ['제목1', '제목2', '제목3'],
        contents: [TableRow(children: [Text('내용1'), Text('내용2'), Text('내용3')])]
    );
  }
}
