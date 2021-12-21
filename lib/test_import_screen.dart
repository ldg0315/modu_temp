import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TestImportScreen extends StatelessWidget {
  const TestImportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _companyController = TextEditingController();
    TextEditingController _nameController = TextEditingController();
    TextEditingController _codeController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('회사명'),
                SizedBox(width: 20),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TextField(
                      controller: _companyController
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text('상품명'),
                SizedBox(width: 20),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TextField(
                      controller: _nameController
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text('코드명'),
                SizedBox(width: 20),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TextField(
                      controller: _codeController
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('추가'),
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(265, 50)
              ),
              onPressed: () async{
                try{
                  //30개씩 생성됨
                 for(int i=0;i<30;i++){
                   await FirebaseFirestore.instance.collection('products').add({
                     'company': _companyController.text,
                     'name': _nameController.text+'$i',
                     'code': _codeController.text+'$i'
                   });
                 }
                    _companyController.text = '';
                    _nameController.text = '';
                    _codeController.text = '';
                }catch(e){
                  print(e);
                }
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.close),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}