import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:modu_temp/common/provider/specs_mode_provider.dart';
import 'package:modu_temp/common/provider/test_provider.dart';
import 'package:modu_temp/common/view/screen_layout.dart';
import 'package:modu_temp/login/view/non_member_auth_view.dart';
import 'package:modu_temp/product/view/new_product_view.dart';
import 'package:modu_temp/specs/view/specs_popup_view.dart';
import 'package:modu_temp/test_screen.dart';
import 'package:modu_temp/test_screen2.dart';
import 'package:provider/provider.dart';
import 'login/view/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeDateFormatting().then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SpecsMode(),
        ),
        ChangeNotifierProvider(
          create: (context) => TestProvider(),
        )
      ],
      child: MaterialApp(
        title: '모두의 거래',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          //'/': (context) => const TestImportScreen(),
          '/': (context) => const TestScreen2(),
          //'/': (context) => const ScreenLayOut(child: NewProductView()),
          //'/': (context) => const NonMemberAuthView(),
          '/specs': (context) => const SpecsPopupView()
        },
      ),
    );
  }
}
