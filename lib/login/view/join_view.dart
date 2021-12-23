import 'package:flutter/material.dart';
import 'package:modu_temp/common/component/button.dart';
import 'package:modu_temp/common/component/input_column.dart';
import 'package:modu_temp/constant/color.dart';
import 'package:modu_temp/login/component/button.dart';
import 'package:modu_temp/login/component/password_field.dart';
import 'package:modu_temp/login/view_model/join_view_model.dart';

import 'join_check_view.dart';

class JoinView extends StatefulWidget {
  const JoinView({Key? key}) : super(key: key);

  @override
  State<JoinView> createState() => _JoinViewState();
}

class _JoinViewState extends State<JoinView> {
  var _isChecked = false;
  var _isChecked2 = false;

  @override
  Widget build(BuildContext context) {
    JoinViewModel _joinViewModel = JoinViewModel();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(80.0),
              color: joinBgColorColor,
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 125),
                width: 1190,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Image(image: AssetImage('assets/images/joinLogo.png')),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              InputColumn(
                                controller: _joinViewModel.controllerList[0],
                                title: '회사명',
                                hint: '회사명을 입력해 주세요.',
                                fillColor: inputWhiteColor,
                                borderColor: inputBorderGreyColor,
                              ),
                              SizedBox(width: 20),
                              InputColumn(
                                controller: _joinViewModel.controllerList[1],
                                title: '성명',
                                hint: '사용자의 이름을 입력해 주세요.',
                                fillColor: inputWhiteColor,
                                borderColor: inputBorderGreyColor,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("주소", style: TextStyle(fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 310,
                                        child: InputField(
                                            controller: _joinViewModel.controllerList[2],
                                            hint: '사업장 주소를 입력해 주세요.',
                                            fillColor: inputWhiteColor,
                                            borderColor: inputBorderGreyColor),
                                      ),
                                      const SizedBox(width: 10,),
                                      SmallButton(title: '주소찾기', press: (){}, width: 140, textColor: smallTitleBlueColor, bgColor: btnGreyColor, borderColor: Colors.black12,)
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    width: 460,
                                    child: InputField(
                                        controller: _joinViewModel.controllerList[3],
                                        hint: '상세주소를 입력해 주세요.',
                                        fillColor: inputWhiteColor,
                                        borderColor: inputBorderGreyColor),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("휴대전화", style: TextStyle(fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 310,
                                        child: InputField(
                                            controller: _joinViewModel.controllerList[4],
                                            hint: '전화번호 입력',
                                            fillColor: inputWhiteColor,
                                            borderColor: inputBorderGreyColor),
                                      ),
                                      const SizedBox(width: 10,),
                                      SmallButton(title: '인증번호 받기', press: (){}, width: 140, textColor: smallTitleBlueColor, bgColor: btnGreyColor, borderColor: Colors.black12),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    width: 460,
                                    child: InputField(
                                        controller: _joinViewModel.controllerList[5],
                                        hint: '인증번호를 입력해 주세요.',
                                        fillColor: inputWhiteColor,
                                        borderColor: inputBorderGreyColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("사업자 등록 번호", style: TextStyle(fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 310,
                                        child: InputField(
                                            controller: _joinViewModel.controllerList[6],
                                            hint: '사업자등록번호를 입력해 주세요.',
                                            fillColor: inputWhiteColor,
                                            borderColor: inputBorderGreyColor),
                                      ),
                                      const SizedBox(width: 10,),
                                      SmallButton(title: '사업자번호 확인', press: (){}, width: 140, textColor: smallTitleBlueColor, bgColor: btnGreyColor, borderColor: Colors.black12),
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 310,
                                        child: InputField(
                                            controller: _joinViewModel.controllerList[7],
                                            hint: '사업자 등록증 첨부 (필수)',
                                            fillColor: inputWhiteColor,
                                            borderColor: inputBorderGreyColor),
                                      ),
                                      const SizedBox(width: 10,),
                                      SmallButton(title: '파일선택', press: (){}, width: 140, textColor: smallTitleBlueColor, bgColor: btnGreyColor, borderColor: Colors.black12),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // SizedBox(height: 20,),
                                  Text("회사 전화번호", style: TextStyle(fontWeight: FontWeight.bold),),
                                  SizedBox(height: 10),
                                  SizedBox(
                                    width: 460,
                                    child: InputField(
                                        controller: _joinViewModel.controllerList[8],
                                        hint: '회사 전화번호를 입력해 주세요.',
                                        fillColor: inputWhiteColor,
                                        borderColor: inputBorderGreyColor),
                                  ),
                                  SizedBox(height: 5),
                                  SizedBox(
                                    width: 460,
                                    child: InputField(
                                        controller: _joinViewModel.controllerList[9],
                                        hint: '회사 팩스번호를 입력해 주세요.',
                                        fillColor: inputWhiteColor,
                                        borderColor: inputBorderGreyColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                              width: 460,
                              child: Divider(height: 80, thickness: 1.0)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("아이디", style: TextStyle(fontWeight: FontWeight.bold),),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 310,
                                    child: InputField(
                                        controller: _joinViewModel.controllerList[10],
                                        hint: '아이디를 입력해 주세요.',
                                        fillColor: inputWhiteColor,
                                        borderColor: inputBorderGreyColor,
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  SmallButton(title: '아이디 중복확인', press: (){}, width: 140, textColor: smallTitleBlueColor, bgColor: btnGreyColor, borderColor: Colors.black12),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  PasswordField(
                                    controller: _joinViewModel.controllerList[11],
                                    title: '비밀번호',
                                    hint: '영문대소문자 8자리 이상',
                                    fillColor: inputWhiteColor,
                                    borderColor: inputBorderGreyColor,
                                  ),
                                  const SizedBox(width: 20,),
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: 460,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Checkbox(
                                                  value: _isChecked,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _isChecked = value!;
                                                    });
                                                  },
                                                  activeColor: primaryBlueColor,
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                ),
                                                const Text("이용약관과 개인정보취급방침에 동의 (필수)", style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                            RoundedButton(title: '이용약관 확인', press: (){})
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10,),
                                      SizedBox(
                                        width: 460,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Checkbox(
                                                  value: _isChecked2,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _isChecked2 = value!;
                                                    });
                                                  },
                                                  activeColor: primaryBlueColor,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5)
                                                  ),
                                                ),
                                                const Text("개인정보수집 및 활용동의 (필수)", style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                            // SizedBox(width: 10,),
                                            RoundedButton(title: '개인정보취급방침', press: (){})
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  PasswordField(
                                    controller: _joinViewModel.controllerList[12],
                                    title: '비밀번호 확인',
                                    hint: '다시 한 번 비밀번호를 입력해 주세요.',
                                    fillColor: inputWhiteColor,
                                    borderColor: inputBorderGreyColor,
                                  ),
                                  const SizedBox(width: 20,),
                                  Column(
                                    children: [
                                      ElevatedButton(
                                        onPressed: (){
                                          _joinViewModel.submitForm();
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => JoinCheckView()));
                                        },
                                        child: const Text("동의하고 무료 회원가입하기", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                                        style: ElevatedButton.styleFrom(
                                            fixedSize: const Size(460, 70),
                                            primary: primaryBlueColor,
                                            elevation: 0.0
                                          // side: const BorderSide(width: 1.0, color: Colors.indigoAccent)
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}

