import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../signin.dart';
import '../splascreen.dart';
import 'dashboard.dart';
import 'login.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));

  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splasscreen(),
    routes: {
      "signin" : (context) => signIn(),
      "login" :(context)=> login(),
      "dashboard" : (context) => Dashboard(),
    },
  ));
}
