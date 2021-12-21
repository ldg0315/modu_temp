import 'package:modu_temp/login/db/login_firestore_crud.dart';
import 'package:modu_temp/login/model/user_model.dart';
import 'package:modu_temp/login/service/login_service_repository.dart';
import 'package:modu_temp/login/view_model/user_view_model.dart';

class SignUpFunction {
  final LoginServiceRepository _loginServiceRepository = LoginServiceRepository();
  final LoginFirestoreCrud _loginFirestoreCrud = LoginFirestoreCrud();

  void signUpFunction(
      {required UserViewModel user}) async {

    bool isCreated = await _loginServiceRepository.createUserWithEmail(email: user.email, password: user.password);
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
