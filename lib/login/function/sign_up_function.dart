import 'package:modu_temp/login/db/login_firestore_crud.dart';
import 'package:modu_temp/login/model/user_model.dart';
import 'package:modu_temp/login/service/firebase_auth_service.dart';
import 'package:modu_temp/login/view_model/user_view_model.dart';

class SignUpFunction {

  final LoginFirestoreCrud _loginFirestoreCrud = LoginFirestoreCrud();
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

  void signUpFunction(
      {required UserViewModel user}) async {

    bool isCreated = await _firebaseAuthService.createUserWithEmail(user.email, user.password);
    print(isCreated);
    if (isCreated) {
      UserModel userModel = UserModel(
          email: user.email,
          companyName: user.companyName,
          name: user.name,
          address: user.address,
          addressDetail: user.addressDetail,
          regNum: user.regNum,
          regImgUrl: user.regImgUrl,
          phone: user.phone,
          companyTel: user.companyTel,
          companyFax: user.companyFax);

      _loginFirestoreCrud.addUserData(userModel);
    }
  }
}
