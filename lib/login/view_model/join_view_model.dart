import 'package:flutter/material.dart';
import 'package:modu_temp/login/function/sign_up_function.dart';
import 'package:modu_temp/login/view_model/user_view_model.dart';

class JoinViewModel{

  List<TextEditingController> controllerList = [];
  late UserViewModel userViewModel;

  JoinViewModel(){
    for(int i=0;i<13;i++){
      controllerList.add(TextEditingController());
    }
    userViewModel = UserViewModel(email: '', companyName: '', name: '', address: '', addressDetail: '', regNum: '', regImgUrl: '', phone: '', companyTel: '', companyFax: '', password: '');
  }

  void saveTempUserData(UserViewModel userData){
    userViewModel = userData;
  }

  void submitForm(){
    UserViewModel _user = UserViewModel(
        email: controllerList[10].text,
        password: controllerList[11].text,
        companyName: controllerList[0].text,
        name: controllerList[1].text,
        address: controllerList[2].text,
        addressDetail: controllerList[3].text,
        regNum: controllerList[6].text,
        regImgUrl: controllerList[7].text,
        phone: controllerList[4].text,
        companyTel: controllerList[8].text,
        companyFax: controllerList[9].text
    );
    SignUpFunction().signUpFunction(user: _user);
    saveTempUserData(_user);
  }
}