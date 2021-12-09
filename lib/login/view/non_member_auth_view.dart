import 'package:flutter/material.dart';
import 'package:modu_temp/common/component/input_column.dart';
import 'package:modu_temp/constant/color.dart';
import 'package:modu_temp/login/view/login_view.dart';
import 'package:modu_temp/login/view/non_member_auth_mobile_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NonMemberAuthView extends StatelessWidget {
  const NonMemberAuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NonMemberAuthMobileView(),
      desktop: NonMemberAuthDesktopView(),
    );
  }
}

class NonMemberAuthDesktopView extends StatelessWidget {
  const NonMemberAuthDesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Stack(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset('assets/images/back.png', fit: BoxFit.cover,)
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50)
            ),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 400,
                    width: 400,
                    child: ClipRRect(
                      child: Image.asset('assets/images/drawing.png', fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                    ),
                  ),
                  Container(
                    height: 400,
                    width: 400,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
                        color: Colors.white
                    ),
                    child: Column(
                      children: [
                        const Center(
                          child: Image(
                            image: AssetImage('assets/images/modu.PNG'),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const Text("- 비회원 인증 페이지 -", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0, color: btnNavyColor),),
                        const SizedBox(height: 20,),
                        const Text("거래처에서 전송한 거래명세서가 있습니다.\n            아래항목을 입력해 주세요.", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: textOrangeColor),),
                        const SizedBox(height: 35.0),
                        const InputColumn(title: "성명", hint: '이름을 입력하세요.', fillColor: inputWhiteColor, borderColor: inputBorderGreyColor),
                        ButtonTheme(
                            child: ElevatedButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginView()));
                              },
                              child: const Text("확인"),
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(400, 40),
                                  primary: primaryBlueColor,
                                  elevation: 0.0
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
