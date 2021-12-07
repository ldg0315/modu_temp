import 'package:flutter/material.dart';
import 'package:modu_temp/common/provider/specs_mode_provider.dart';
import 'package:modu_temp/specs/view/specs_classic_view.dart';
import 'package:modu_temp/specs/view/specs_easy_view.dart';
import 'package:provider/provider.dart';

class SpecsView extends StatelessWidget {
  const SpecsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<SpecsMode>().isClassic ? SpecsClassicView() : SpecsEasyView();
  }
}