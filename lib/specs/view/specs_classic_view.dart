import 'package:flutter/material.dart';
import 'package:modu_temp/common/component/header.dart';
import 'package:modu_temp/constant/color.dart';
import 'package:modu_temp/specs/component/bottom_buttons.dart';
import 'package:modu_temp/specs/model/specs_model.dart';
import 'package:modu_temp/specs/model/specs_model_list.dart';

class SpecsClassicView extends StatelessWidget {
  const SpecsClassicView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SpecsItemModel> items = [BC, YC];
    return Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(isLarge: true,),
          const SizedBox(height: 20),
          Container(
            width: 1045,
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Column(
              children: [
                topRow(),
                // 중간 부분
                centerTitle(),
                for(int i = 0; i < items.length; i++)
                  centerContent(items, i),
                //중간 빈칸
                for(int i=0;i<5-items.length;i++)
                  centerEmpty(),
                bottomTotalRow(),
                bottomBalanceRow(),
                bottomRow(),
              ],
            ),
          ),
          const SizedBox(height: 20),
          BottomButtons()
        ],
      ),
    );
  }

  Row topRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: [
            Row(
              children: [
                const _TextContainer(title: '페이지', width: 100, height: 50, isTitle: true, isBold: false,),
                _TextContainer(title: specsModel.page, width: 135, height: 50, isTitle: false, isBold: false,),
              ],
            ),
            Row(
              children: [
                const _TextContainer(title: '발행일자', width: 100, height: 50, isTitle: true, isBold: false,),
                _TextContainer(title: '${specsModel.date.year}.${specsModel.date.month}.${specsModel.date.day}', width: 135, height: 50, isTitle: false, isBold: false,),
              ],
            ),
            Row(
              children: [
                const _TextContainer(title: '거래처명', width: 100, height: 50, isTitle: true, isBold: false,),
                _TextContainer(title: specsModel.counterpart, width: 135, height: 50, isTitle: false, isBold: false,),
              ],
            ),
            Container(
              alignment: Alignment.center,
              child: const Text('합계금액', textAlign: TextAlign.center, style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),),
              width: 235,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: tradeBorderGreyColor),
                color: innerCellBlueColor,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text('거래명세서', textAlign: TextAlign.center, style: TextStyle(fontSize: 39.0, fontWeight: FontWeight.bold),),
              width: 320,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: tradeBorderGreyColor),
                color: innerCellBlueColor,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(specsModel.totalPrice, textAlign: TextAlign.center, style: const TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),),
              width: 320,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: tradeBorderGreyColor),
                // color: isTitle?innerCellBlueColor:Colors.white,
    ),
    )
            // _TextContainer(title: specsModel.totalPrice, width: 320, height: 100, isTitle: false, isBold: true,),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                const _TextContainer(title: '사업자 등록번호', width: 235, height: 50, isTitle: true, isBold: false,),
                _TextContainer(title: specsModel.registrationNum, width: 235, height: 50, isTitle: false, isBold: false,),
              ],
            ),
            Row(
              children: [
                const _TextContainer(title: '상호', width: 80, height: 50, isTitle: true, isBold: false,),
                _TextContainer(title: specsModel.company, width: 155, height: 50, isTitle: false, isBold: false,),
                const _TextContainer(title: '대표자', width: 80, height: 50, isTitle: true, isBold: false,),
                _TextContainer(title: specsModel.providerName, width: 155, height: 50, isTitle: false, isBold: false,),
              ],
            ),
            Row(
              children: [
                const _TextContainer(title: '주소', width: 80, height: 50, isTitle: true, isBold: false,),
                _TextContainer(title: specsModel.officeAddress, width: 390, height: 50, isTitle: false, isBold: false,),
              ],
            ),
            Row(
              children: [
                const _TextContainer(title: '업태', width: 80, height: 50, isTitle: true, isBold: false,),
                _TextContainer(title: specsModel.industry, width: 155, height: 50, isTitle: false, isBold: false,),
                const _TextContainer(title: '종목', width: 80, height: 50, isTitle: true, isBold: false,),
                _TextContainer(title: specsModel.product, width: 155, height: 50, isTitle: false, isBold: false,),
              ],
            ),
            Row(
              children: [
                const _TextContainer(title: '전화', width: 80, height: 50, isTitle: true, isBold: false,),
                _TextContainer(title: specsModel.telephone, width: 155, height: 50, isTitle: false, isBold: false,),
                const _TextContainer(title: '팩스', width: 80, height: 50, isTitle: true, isBold: false,),
                _TextContainer(title: specsModel.fax, width: 155, height: 50, isTitle: false, isBold: false,),
              ],
            ),
          ],
        )
      ],
    );
  }

  Row centerTitle() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        _TextContainer(title: '품목코드', width: 130, height: 40, isTitle: true, isBold: false,),
        _TextContainer(title: '품목', width: 185, height: 40, isTitle: true, isBold: false,),
        _TextContainer(title: '상세내용', width: 105, height: 40, isTitle: true, isBold: false,),
        _TextContainer(title: '규격', width: 110, height: 40, isTitle: true, isBold: false,),
        _TextContainer(title: '수량', width: 105, height: 40, isTitle: true, isBold: false,),
        _TextContainer(title: '단가', width: 130, height: 40, isTitle: true, isBold: false,),
        _TextContainer(title: '공급가액', width: 130, height: 40, isTitle: true, isBold: false,),
        _TextContainer(title: '세액', width: 130, height: 40, isTitle: true, isBold: false,),
      ],
    );
  }

  Row centerContent(List<SpecsItemModel> items, int i) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _TextContainer(title: items[i].productCode, width: 130, height: 40, isTitle: false, isBold: false,),
        _TextContainer(title: items[i].productName, width: 185, height: 40, isTitle: false, isBold: false,),
        _TextContainer(title: items[i].detailInfo, width: 105, height: 40, isTitle: false, isBold: false,),
        _TextContainer(title: items[i].size, width: 110, height: 40, isTitle: false, isBold: false,),
        _TextContainer(title: items[i].amount.toString(), width: 105, height: 40, isTitle: false, isBold: false,),
        _NumContainer(title: items[i].unitPrice.toString(), width: 130, height: 40, isTitle: false, isBold: false,),
        _NumContainer(title: items[i].valueOfSupply.toString(), width: 130, height: 40, isTitle: false, isBold: false,),
        _NumContainer(title: items[i].tax.toString(), width: 130, height: 40, isTitle: false, isBold: false,),
      ],
    );
  }

  Row centerEmpty() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        _TextContainer(title: '', width: 130, height: 40, isTitle: false, isBold: false,),
        _TextContainer(title: '', width: 185, height: 40, isTitle: false, isBold: false,),
        _TextContainer(title: '', width: 105, height: 40, isTitle: false, isBold: false,),
        _TextContainer(title: '', width: 110, height: 40, isTitle: false, isBold: false,),
        _TextContainer(title: '', width: 105, height: 40, isTitle: false, isBold: false,),
        _TextContainer(title: '', width: 130, height: 40, isTitle: false, isBold: false,),
        _TextContainer(title: '', width: 130, height: 40, isTitle: false, isBold: false,),
        _TextContainer(title: '', width: 130, height: 40, isTitle: false, isBold: false,),
      ],
    );
  }

  Row bottomTotalRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.center,
          child: const Text(''),
          width: 635,
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: tradeBorderGreyColor),
              color: Colors.white
          ),
        ),
        const _TextContainer(title: '합계', width: 130, height: 50, isTitle: true, isBold: false,),
        _NumContainer(title: specsModel.total.toString(), width: 130, height: 50, isTitle: false, isBold: false,),
        _NumContainer(title: (specsModel.total/10).toString(), width: 130, height: 50, isTitle: false, isBold: false,),
      ],
    );
  }

  Row bottomBalanceRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _TextContainer(title: '전잔금', width: 420, height: 50, isTitle: true, isBold: true,),
        _NumContainer(title: specsModel.exBalance.toString(), width: 215, height: 50, isTitle: false, isBold: true,),
        const _TextContainer(title: '', width: 130, height: 50, isTitle: false, isBold: false,),
        const _TextContainer(title: '총금액', width: 130, height: 50, isTitle: true, isBold: true,),
        _NumContainer(title: specsModel.totalPrice2.toString(), width: 130, height: 50, isTitle: false, isBold: true,),
      ],
    );
  }

  Row bottomRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _TextContainer(title: '입금', width: 130, height: 50, isTitle: true, isBold: true,),
        const _TextContainer(title: '', width: 185, height: 50, isTitle: false, isBold: true,),
        const _TextContainer(title: '잔금', width: 105, height: 50, isTitle: true, isBold: true,),
        _NumContainer(title: specsModel.balance.toString(), width: 215, height: 50, isTitle: false, isBold: true,),
        const _TextContainer(title: '', width: 130, height: 50, isTitle: false, isBold: false,),
        const _TextContainer(title: '인수자', width: 130, height: 50, isTitle: true, isBold: true,),
        _TextContainer(title: specsModel.underwriter, width: 130, height: 50, isTitle: false, isBold: true,),
      ],
    );
  }

}

class _TextContainer extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final bool isTitle;
  final bool isBold;
  const _TextContainer({Key? key, required this.title, required this.width, required this.height, required this.isTitle, required this.isBold}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(title, textAlign: TextAlign.center, style: TextStyle(fontWeight: isBold?FontWeight.bold:null),),
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: tradeBorderGreyColor),
        color: isTitle?innerCellBlueColor:Colors.white,
      ),
    );
  }
}

class _NumContainer extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final bool isTitle;
  final bool isBold;
  const _NumContainer({Key? key, required this.title, required this.width, required this.height, required this.isTitle, required this.isBold}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.centerRight,
      child: Text(title, textAlign: TextAlign.center, style: TextStyle(fontWeight: isBold?FontWeight.bold:null),),
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: tradeBorderGreyColor),
        color: isTitle?innerCellBlueColor:Colors.white,
      ),
    );
  }
}
