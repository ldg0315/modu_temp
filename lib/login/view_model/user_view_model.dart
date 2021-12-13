import 'package:modu_temp/login/model/user_model.dart';

class UserViewModel {
  final UserModel _user;
  final String password;

  UserViewModel(
      {required email,
      required companyName,
      required name,
      required address,
      required addressDetail,
      required regNum,
      required regImgUrl,
      required phone,
      required companyTel,
      required companyFax,
      required this.password
      })
      : _user = UserModel(
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

  String get email => _user.email;

  String get companyName => _user.companyName;

  String get name => _user.name;

  String get address => _user.address;

  String get addressDetail => _user.addressDetail;

  String get regNum => _user.regNum;

  String get regImgUrl => _user.regImgUrl;

  String get phone => _user.phone;

  String get companyTel => _user.companyTel;

  String get companyFax => _user.companyFax;
}
