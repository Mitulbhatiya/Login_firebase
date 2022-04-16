import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_helper.dart';



class signIn extends StatefulWidget {

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  FirebaseAuth auth = FirebaseAuth.instance;
  GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width =MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      body:SingleChildScrollView(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: _height,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 150,
                    width: 210,
                    decoration: BoxDecoration(
                    ),
                    child: Text("SignUp",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.red.shade900,letterSpacing: 3),),
                  ),
                  // SizedBox(
                  //   height: _height*0.01,
                  // ),
                  Form(
                    key: _registerFormKey,
                    child: Column(
                      children: [
                        Container(
                          width: _width*0.9,
                          child: TextFormField(
                            controller: _emailController,
                            validator: (val){
                              if(val!.isEmpty){
                                return "Enter any email first...";
                              }
                              return null;
                            },
                            onSaved: (val){
                              setState(() {
                                email = val!;
                              });
                            },
                            decoration: InputDecoration(
                              hintStyle:TextStyle(letterSpacing: 2,fontSize: 14),
                              hintText: "Enter Your Email",
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Icon(Icons.person,color: Colors.red.shade900,),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      color: Colors.red.shade900,
                                      width: 1
                                  )
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 1
                                  )
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: _height*0.03,
                        ),
                        Container(
                          width: _width*0.9,
                          child: TextFormField(
                            controller: _passwordController,
                            validator: (val){
                              if(val!.isEmpty){
                                return "Enter any password first...";
                              }
                              return null;
                            },
                            onSaved: (val){
                              setState(() {
                                password = val!;
                              });
                            },
                            decoration: InputDecoration(
                              hintStyle:TextStyle(letterSpacing: 2,fontSize: 14),
                              hintText: "Create Your Password",
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Icon(Icons.lock,color: Colors.red.shade900,),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      color: Colors.red.shade900,
                                      width: 1
                                  )
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 1
                                  )
                              ),
                            ),
                            obscureText: true,
                          ),
                        ),
                        SizedBox(
                          height: _height*0.03,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: ()async {
                      if(_registerFormKey.currentState!.validate()){
                        _registerFormKey.currentState!.save();
                        Navigator.pushNamed(context, "login");

                      }
                      UserCredential userCredential = await FirebaseHelper.instance.registerWithEmailAndPassword(email: email, password: password);
                      _emailController.clear();
                      _passwordController.clear();
                      setState(() {
                        email = "";
                        password = "";
                      });
                      print("user: ${userCredential.user!.uid}\nEmail: ${userCredential.user!.email}");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("SignIn Successful...."),
                        ),
                      );
                    },
                    child: Text("SignUp",style: TextStyle(letterSpacing: 2),),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(_width*0.6,_height*0.05),
                      primary: Colors.red.shade900,
                      shape: StadiumBorder(),
                    ),
                  ),
                  SizedBox(
                    height: _height*0.03,
                  ),
                  Text("Already existing"),
                  InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, 'login');
                      },
                      child: Text("Login",style: TextStyle(decoration: TextDecoration.underline,color: Colors.red.shade900),))

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
