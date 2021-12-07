import 'package:flutter/material.dart';
import 'package:modu_temp/common/view/screen_layout.dart';
import 'package:modu_temp/constant/color.dart';
import 'package:modu_temp/home/view/home_view.dart';
import 'package:modu_temp/login/view/login_view.dart';
import 'package:modu_temp/product/view/new_product_view.dart';
import 'package:modu_temp/specs/view/specs_view.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Drawer(
        child: Container(
          color: btnNavyColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: DrawerHeader(
                    child: Image.asset('assets/images/drawerLogo.png')),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ScreenLayOut(child: HomeView())));
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0, left: 16.0, bottom: 10.0),
                child: Text('MAIN', style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w800),),
              ),
              SideListTile(
                icon: Icons.storefront,
                title: '상품 관리',
                alert: 1,
                child: NewProductView(),
              ),
              SideListTile(
                icon: Icons.account_box_outlined,
                title: '거래처 관리',
                child: HomeView(),
              ),
              SideListTile(
                icon: Icons.sticky_note_2_outlined,
                title: '거래명세서 관리',
                child: SpecsView(),
              ),
              SideListTile(
                icon: Icons.account_box_outlined,
                title: '발주서 관리',
              ),
              SideListTile(icon: Icons.account_box_outlined, title: '견적서 관리'),
              SideListTile(icon: Icons.headset_mic_outlined, title: '고객센터'),
              SideListTile(icon: Icons.exit_to_app, title: '로그아웃', child: LoginView(),),
              Padding(
                padding: EdgeInsets.only(top: 30.0, left: 16.0, bottom: 10.0),
                child: Text('GENERAL', style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w800),),
              ),
              SideListTile(icon: Icons.help_outline, title: '문의사항', alert: 9),
              SideListTile(icon: Icons.settings, title: '설정하기'),
              SideListTile(icon: Icons.people, title: '거래처 매칭'),
            ],
          ),
        ),
      ),
    );
  }
}

class SideListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final int? alert;
  final Widget? child;

  SideListTile(
      {Key? key, required this.icon, required this.title, this.alert, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      leading: Icon(icon, color: Colors.white54,
      ),
      title: Text(title, style: const TextStyle(color: Colors.white54),
      ),
      trailing: alert != null
          ? Container(
        width: 20,
        height: 20,
        decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        alignment: Alignment.center,
        child: Text(
          '$alert',
          style: const TextStyle(color: Colors.white),
        ),
      )
          : null,
      onTap: () {
        if (child != null) {
          child is LoginView
              ? Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()))
              : Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenLayOut(child: child!)));
        }
      },
      hoverColor: const Color(0x7E8989D9),
    );
  }
}
