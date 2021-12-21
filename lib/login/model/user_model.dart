class UserModel {
  String email;
  String companyName;
  String name;
  String address;
  String addressDetail;
  String regNum;
  String regImgUrl;
  String phone;
  String companyTel;
  String companyFax;

  UserModel(
      {required this.email,
      required this.companyName,
      required this.name,
      required this.address,
      required this.addressDetail,
      required this.regNum,
      required this.regImgUrl,
      required this.phone,
      required this.companyTel,
      required this.companyFax});

  Map<String, dynamic> toMap() => {
    'email': email,
    'companyName': companyName,
    'name': name,
    'address': address,
    'addressDetail': addressDetail,
    'regNum': regNum,
    'regImgUrl': regImgUrl,
    'phone': phone,
    'companyTel': companyTel,
    'companyFax': companyFax
  };

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
      email: map['email'],
      companyName: map['companyName'],
      name: map['name'],
      address: map['address'],
      addressDetail: map['addressDetail'],
      regNum: map['regNum'],
      regImgUrl: map['regImgUrl'],
      phone: map['phone'],
      companyTel: map['companyTel'],
      companyFax: map['companyFax']);
}
