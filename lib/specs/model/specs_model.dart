import 'package:modu_temp/specs/model/specs_model_list.dart';

class SpecsModel {
  String page; //편의상 String, 나중에 수정할 것
  DateTime date;
  String counterpart; //거래처명. 변수명 바꾸는 게 좋을 듯
  String totalPrice;
  String registrationNum;
  String company;
  String providerName;
  String officeAddress;
  String industry;
  String product;
  String telephone;
  String fax;
  List<SpecsItemModel> details = [];
  int exBalance;
  int balance = 0;
  int totalPrice2 = 0;
  int total = 0;
  String underwriter;

  SpecsModel({required this.page,
    required this.date,
    required this.company,
    required this.counterpart,
    required this.industry,
    required this.officeAddress,
    required this.product,
    required this.providerName,
    required this.registrationNum,
    required this.telephone,
    required this.totalPrice,
    required this.fax,
    required this.details,
    required this.underwriter,
    required this.exBalance}) {

    for (int i = 0; i < details.length; i++) {
      totalPrice2 = totalPrice2 + details[i].valueOfSupply + details[i].tax;
      total += details[i].valueOfSupply;
    }
    balance = exBalance + totalPrice2;
  }
}

SpecsModel specsModel = SpecsModel(
  page: '1/1',
  date: DateTime(2021, 09, 03),
  counterpart: '준하우스',
  totalPrice: '일금칠백칠십칠만원\n     (7,770,000원)',
  registrationNum: '876-86-00245',
  company: '(주)네이첸',
  providerName: '심현주',
  officeAddress: '울산광역시 울주군 웅촌면 고연공단2길 130',
  industry: '도소매',
  product: '도어,몰딩',
  telephone: '052-256-8907',
  fax: '052-256-8906',
  details: [BC, YC],
  exBalance: 10000000,
  underwriter: '길은석',
);
