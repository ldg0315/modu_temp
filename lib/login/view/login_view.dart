import 'package:flutter/material.dart';
import 'package:modu_temp/common/component/rounded_checkbox.dart';
import 'package:modu_temp/constant/color.dart';
import 'package:modu_temp/login/view/join_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginView> {
  var _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/back.jpg', fit: BoxFit.cover,)
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50)
            ),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 400,
                    width: 400,
                    child: ClipRRect(
                        child: Image.asset('assets/images/drawing.png', fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                    ),
                  ),
                  Container(
                    height: 400,
                    width: 400,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                      color: Colors.white
                    ),
                    child: Column(
                      children: [
                        const Center(
                          child: Image(
                            image: AssetImage('assets/images/modu.PNG'),
                          ),
                        ),
                        const SizedBox(height: 15.0,),
                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.perm_identity, color: Colors.grey),
                            border: OutlineInputBorder(),
                            labelText: '????????? ????????? ???????????????',
                            labelStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: innerCellBlue,
                            floatingLabelStyle: TextStyle(color: primaryBlue),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryBlue, width: 2)
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.lock_outline, color: Colors.grey),
                              border: OutlineInputBorder(),
                              labelText: '??????????????? ???????????????',
                              labelStyle: TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: innerCellBlue,
                            floatingLabelStyle: TextStyle(color: primaryBlue),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryBlue, width: 2)
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                RoundedCheckBox(
                                    isChecked: _isChecked,
                                    changed: (value) {
                                      setState(() {
                                        _isChecked = value!;
                                      });
                                    }),
                                Row(
                                   children: const [
                                     Text("????????? ", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),),
                                     Text("??????", style: TextStyle(fontSize: 12.0, color: Colors.indigo, fontWeight: FontWeight.bold),),
                                     Text('?????????', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),)
                                   ],
                                 ),
                              ],
                            ),
                            Row(
                              children: const [
                                Text("????????? ??????", style: TextStyle(fontSize: 12.0)),
                                SizedBox(width: 10.0),
                                Text("???????????? ??????", style: TextStyle(fontSize: 12.0)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 40,),
                        ElevatedButton(
                          onPressed: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => JoinView()));
                          },
                          child: const Text("?????????", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(400, 40),
                              primary: loginBtnGrey,
                              side: const BorderSide(width: 1.0, color: loginBtnBorderGrey),
                              elevation: 0.0
                          ),
                        ),
                        const SizedBox(height: 10,),
                        ButtonTheme(
                            child: ElevatedButton(
                                onPressed: (){},
                                child: const Text("????????? ???????????????"),
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(400, 40),
                                primary: primaryBlue,
                                  elevation: 0.0
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
