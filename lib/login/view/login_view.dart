import 'package:flutter/material.dart';
import 'package:modu_temp/common/component/rounded_checkbox.dart';
import 'package:modu_temp/common/view/screen_layout.dart';
import 'package:modu_temp/constant/color.dart';
import 'package:modu_temp/home/view/home_view.dart';
import 'package:modu_temp/login/service/firebase_auth_service.dart';
import 'package:modu_temp/login/service/login_service_repository.dart';
import 'package:modu_temp/login/view/join_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  var _isChecked = false;
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
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                    ),
                  ),
                  Container(
                    height: 400,
                    width: 400,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                        color: Colors.white
                    ),
                    child: Column(
                      children: [
                        const Center(
                          child: Image(
                            image: AssetImage('assets/images/modu.PNG'),
                          ),
                        ),
                        const SizedBox(height: 15.0,),
                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.perm_identity, color: Colors.grey),
                            border: OutlineInputBorder(),
                            labelText: '이메일 주소를 입력하세요',
                            labelStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: innerCellBlueColor,
                            floatingLabelStyle: TextStyle(color: primaryBlueColor),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryBlueColor, width: 2)
                            ),
                          ),
                          controller: _emailController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline, color: Colors.grey),
                            border: OutlineInputBorder(),
                            labelText: '패스워드를 입력하세요',
                            labelStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: innerCellBlueColor,
                            floatingLabelStyle: TextStyle(color: primaryBlueColor),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryBlueColor, width: 2)
                            ),
                          ),
                          controller: _passwordController,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                RoundedCheckBox(
                                    isChecked: _isChecked,
                                    changed: (value) {
                                      setState(() {
                                        _isChecked = value!;
                                      });
                                    }),
                                Row(
                                  children: const [
                                    Text("계정을 ", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),),
                                    Text("기억", style: TextStyle(fontSize: 12.0, color: Colors.indigo, fontWeight: FontWeight.bold),),
                                    Text('합니다', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Text("아이디 찾기", style: TextStyle(fontSize: 12.0)),
                                SizedBox(width: 10.0),
                                Text("비밀번호 찾기", style: TextStyle(fontSize: 12.0)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 40,),
                        ElevatedButton(
                          onPressed: () async {
                            bool isLogin = await LoginServiceRepository().signInWithEmail(email: _emailController.text, password: _passwordController.text);
                            if(isLogin){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenLayOut(child: HomeView())));
                            }
                          },
                          child: const Text("로그인", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(400, 40),
                              primary: loginBtnGreyColor,
                              side: const BorderSide(width: 1.0, color: loginBtnBorderGreyColor),
                              elevation: 0.0
                          ),
                        ),
                        const SizedBox(height: 10,),
                        ButtonTheme(
                            child: ElevatedButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>JoinView()));
                              },
                              child: const Text("무료로 시작해보기"),
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
