import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modu_temp/test_import_screen.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late String search;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    search = '';
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('products')
            .orderBy('name')
            .startAt([search]).endAt([search + '\uf8ff']).snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) return LinearProgressIndicator();

          return Scaffold(
            body: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(100.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: KeyboardListener(
                            focusNode: FocusNode(),
                            onKeyEvent: (event){
                              setState(() {
                                search = _controller.text;
                              });
                            },
                            child: TextField(controller: _controller)
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        height: 300,
                        child: ListView(
                          children: snapshot.data!.docs.map((e) => Text(e['name'])).toList()
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer()
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>TestImportScreen()));
              },
            ),
          );
        }
    );
  }
}


