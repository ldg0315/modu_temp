import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modu_temp/test_import_screen.dart';
import 'package:provider/provider.dart';

import 'common/provider/test_provider.dart';

class TestScreen2 extends StatelessWidget {
  const TestScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('products')
            //.where('company', isEqualTo: 'ABC')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const LinearProgressIndicator();

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
                              context.read<TestProvider>().changeSearch(_controller.text);
                            },
                            child: TextField(controller: _controller)),
                      ),
                      context.watch<TestProvider>().search != ''
                          ? SizedBox(
                              width: 200,
                              height: 300,
                              child: ListView(
                                  children: snapshot.data!.docs.map((e) {
                                if (e['name']
                                    .toString()
                                    .contains(context.watch<TestProvider>().search)) {
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
                        builder: (context) => const TestImportScreen()));
              },
            ),
          );
        });
  }
}
