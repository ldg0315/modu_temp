import 'package:modu_temp/login/db/login_firestore_crud.dart';
import 'package:modu_temp/login/model/user_model.dart';
import 'package:modu_temp/login/service/firebase_auth_service.dart';

class SignUpFunction {

  final LoginFirestoreCrud _loginFirestoreCrud = LoginFirestoreCrud();
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

  void signUpFunction(
      {required email,
      required password,
      required companyName,
      required name,
      required address,
      required addressDetail,
      required regNum,
      required regImgUrl,
      required phone,
      required companyTel,
      required companyFax}) async {

    bool isCreated = await _firebaseAuthService.createUserWithEmail(email, password);
    print(isCreated);
    if (isCreated) {
      UserModel userModel = UserModel(
          email: email,
          companyName: companyName,
          name: name,
          address: address,
          addressDetail: addressDetail,
          regNum: regNum,
          regImgUrl: regImgUrl,
          phone: phone,
          companyTel: companyTel,
          companyFax: companyFax);

      _loginFirestoreCrud.addUserData(userModel);
    }
  }
}
