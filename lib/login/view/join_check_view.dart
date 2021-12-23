import 'package:flutter/material.dart';
import 'package:modu_temp/common/component/button.dart';
import 'package:modu_temp/common/view/screen_layout.dart';
import 'package:modu_temp/constant/color.dart';
import 'package:modu_temp/home/view/home_view.dart';
import 'package:modu_temp/login/view_model/join_view_model.dart';

class JoinCheckView extends StatelessWidget {

  const JoinCheckView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JoinViewModel _joinViewModel = JoinViewModel();
    print(_joinViewModel.userViewModel.phone);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(80.0),
            color: joinBgColorColor,
            alignment: Alignment.center,
            child: Column(
                children: [
                  const Image(image: AssetImage('assets/images/joinLogo.png')),
                  const SizedBox(height: 10,),
                  const Text('가입 정보 확인', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  const SizedBox(height: 20,),
                  CheckColumn(title: '회사명', content: _joinViewModel.userViewModel.companyName, isWide: true),
                  const SizedBox(height: 20),
                  CheckColumn(title: '사업자등록번호', content: _joinViewModel.userViewModel.regNum, isWide: true),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CheckColumn(title: '아이디', content: _joinViewModel.userViewModel.email),
                      const SizedBox(width: 10),
                      CheckColumn(title: '이름', content: _joinViewModel.userViewModel.name),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CheckColumn(title: '전화번호', content: _joinViewModel.userViewModel.companyTel),
                      const SizedBox(width: 10),
                      CheckColumn(title: '휴대전화', content: _joinViewModel.userViewModel.phone),
                    ],
                  ),
                  SizedBox(child: Divider(height: 40,), width: 460,),
                  Column(
                    children: [
                      Text('사업자등록증상 대표자에게 가입확인 메세지가 발송됩니다.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CheckColumn(title: '대표자', content: '최성우'),
                          const SizedBox(width: 10),
                          CheckColumn(title: '대표자 휴대전화', content: '010-2224-1111'),
                        ],
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                  Text('입력하신 내용으로 가입을 신청하시겠습니까?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  const SizedBox(height: 20,),
                  SmallButton(
                  title: '확인',
                  press: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenLayOut(child: HomeView())));
                  },
                  width: 460,
                  bgColor: primaryBlueColor,
                )
              ],
              ),
          ),
        ),
      ),
    );
  }
}

class CheckColumn extends StatelessWidget {
  final String title;
  final String content;
  bool? isWide;
  CheckColumn({Key? key, required this.title, required this.content, this.isWide}){
    if(isWide == null){
      isWide = false;
    }
}

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
        const SizedBox(height: 10,),
        Container(
          width: isWide!?460:225,
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: inputBorderGreyColor),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: inputWhiteColor
          ),
          alignment: Alignment.centerLeft,
          child: Text(content),
        )
      ],
    );
  }
}
