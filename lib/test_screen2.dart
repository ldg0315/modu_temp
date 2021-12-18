import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modu_temp/test_import_screen.dart';

class TestScreen2 extends StatefulWidget {
  const TestScreen2({Key? key}) : super(key: key);

  @override
  State<TestScreen2> createState() => _TestScreen2State();
}

class _TestScreen2State extends State<TestScreen2> {
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
            //.where('company', isEqualTo: 'ABC')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();

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
                            onKeyEvent: (event) {
                              setState(() {
                                search = _controller.text;
                              });
                            },
                            child: TextField(controller: _controller)),
                      ),
                      search != ''
                          ? SizedBox(
                              width: 200,
                              height: 300,
                              child: ListView(
                                  children: snapshot.data!.docs.map((e) {
                                if (e['name']
                                    .toString()
                                    .contains(_controller.text)) {
                                  return Text(e['name']);
                                }
                                return Container();
                              }).toList()),
                            )
                          : Container()
                    ],
                  ),
                ),
                const Spacer()
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TestImportScreen()));
              },
            ),
          );
        });
  }
}
