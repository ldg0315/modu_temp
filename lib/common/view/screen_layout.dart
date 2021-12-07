import 'package:flutter/material.dart';
import 'package:modu_temp/common/component/side_menu.dart';

class ScreenLayOut extends StatelessWidget {
  final Widget child;
  const ScreenLayOut({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                color: const Color(0xffeff6ff),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SideMenu(),
                  Expanded(child: child)
                ],
              ),
            ],
          ),
        )
    );
  }
}
