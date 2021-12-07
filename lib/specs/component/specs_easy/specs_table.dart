import 'package:flutter/material.dart';
import 'package:modu_temp/constant/color.dart';

class SpecsTable extends StatefulWidget {
  final List<String> titles;
  final List<List<dynamic>> contents;
  final List<bool> isSelected;
  const SpecsTable({Key? key, required this.titles, required this.contents, required this.isSelected}) : super(key: key);

  @override
  State<SpecsTable> createState() => _SpecsTableState();
}

class _SpecsTableState extends State<SpecsTable> {
  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FixedColumnWidth(150),
        1: FixedColumnWidth(150),
        2: FixedColumnWidth(100),
        3: FixedColumnWidth(100),
        4: FixedColumnWidth(50),
        5: FixedColumnWidth(120),
        6: FixedColumnWidth(120),
        7: FixedColumnWidth(120),
        8: FixedColumnWidth(50)
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: lightGreyColor))),
            children: widget.titles
                .map((title) => Container(
                child: Text(title, style: const TextStyle(color: smallTitleBlueColor, fontWeight: FontWeight.bold),),
                height: 50,
                alignment: Alignment.center))
                .toList()),
        for (int j = 0; j < widget.contents.length; j++)
          TableRow(
              decoration:
              j % 2 != 0 ? const BoxDecoration(color: innerCellBlueColor) : null,
              children: [
                for (int i = 0; i < widget.contents[j].length; i++)
                  if (i == 1)
                    _TextContainer(title: widget.contents[j][i].toString(), color: Color(0xffCCCCCC))
                  else if (i == 4)
                    InkWell(
                        onTap: () {
                          setState(() {
                            widget.isSelected[j] = !widget.isSelected[j];
                          });
                        },
                        child: widget.isSelected[j]
                            ? Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: lightGreyColor, width: 2),
                              borderRadius: const BorderRadius.all(Radius.circular(5))
                          ),
                          child: TextField(
                            controller: TextEditingController()
                              ..text = widget.contents[j][i].toString(),
                            decoration: const InputDecoration(border: OutlineInputBorder(borderSide: BorderSide.none),),
                            onChanged: (value) {
                              int newInt = int.parse(value);
                              widget.contents[j][i] = newInt;
                            },
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.top,
                          ),
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                        )
                            : _TextContainer(title: widget.contents[j][i].toString(), color: hintTextGreyColor)
                    )
                  else if (i == 8)
                      InkWell(
                          onTap: () {},
                          child: _TextContainer(title: widget.contents[j][i], color: textOrangeColor))
                    else
                      _TextContainer(title: widget.contents[j][i].toString(), color: hintTextGreyColor)
              ]),
      ],
    );
  }
}

class _TextContainer extends StatelessWidget {
  final String title;
  final Color color;
  const _TextContainer({Key? key, required this.title, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(title,
          style: TextStyle(color: color, fontWeight: FontWeight.bold)),
      height: 50,
      alignment: Alignment.center,
    );
  }
}