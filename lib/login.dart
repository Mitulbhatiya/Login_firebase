import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'firebase_helper.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  FirebaseAuth auth = FirebaseAuth.instance;
  GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController emailloginController = TextEditingController();
  TextEditingController _passwordloginController = TextEditingController();

  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: _height * 0.25,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 150,
                  width: 210,
                  decoration: BoxDecoration(),
                  child: Text(
                    "LogIn",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade900,
                        letterSpacing: 3),
                  ),
                ),
                Form(
                  key: _registerFormKey,
                  child: Column(
                    children: [
                      Container(
                        width: _width * 0.9,
                        child: TextFormField(
                          controller: emailloginController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter any email first...";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              email = val!;
                            });
                          },
                          decoration: InputDecoration(
                            hintStyle:
                            TextStyle(letterSpacing: 2, fontSize: 14),
                            hintText: "Enter Your Email",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Icon(
                                Icons.person,
                                color: Colors.red.shade900,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                BorderSide(color: Colors.red.shade900, width: 1)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                BorderSide(color: Colors.red, width: 1)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _height * 0.03,
                      ),
                      Container(
                        width: _width * 0.9,
                        child: TextFormField(
                          controller: _passwordloginController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter any password first...";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              password = val!;
                            });
                          },
                          decoration: InputDecoration(
                            hintStyle:
                            TextStyle(letterSpacing: 2, fontSize: 14),
                            hintText: "Enter Your Password",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Icon(
                                Icons.lock,
                                color: Colors.red.shade900,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                BorderSide(color: Colors.red.shade900, width: 1)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                BorderSide(color: Colors.red, width: 1)),
                          ),
                          obscureText: true,
                        ),
                      ),
                      SizedBox(
                        height: _height * 0.03,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_registerFormKey.currentState!.validate()) {
                      _registerFormKey.currentState!.save();
                      Navigator.pushNamed(
                        context,
                        "dashboard",
                      );
                    }
                    try {
                      UserCredential userCredential = await FirebaseHelper
                          .instance
                          .signinWithEmailAndPassword(
                          email: email, password: password);
                      emailloginController.clear();
                      _passwordloginController.clear();
                      setState(() {
                        email = "";
                        password = "";
                      });
                      Navigator.pushNamed(context, 'dashboard',arguments: userCredential);
                      print("Login successful....");
                      print(
                          "user: ${userCredential.user!.uid}\nEmail: ${userCredential.user!.email}");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("LogIn Successful...."),
                        ),
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print("User not found");
                      } else if (e.code == 'wrong-password') {
                        print("Incorrect password");
                      }
                    }
                  },
                  child: Text(
                    "LogIn",
                    style: TextStyle(letterSpacing: 2),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(_width * 0.6, _height * 0.05),
                    primary: Colors.red.shade900,
                    shape: StadiumBorder(),
                  ),
                ),
                SizedBox(
                  height: _height * 0.03,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
