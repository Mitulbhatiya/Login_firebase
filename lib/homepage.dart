import 'package:login_firebase/dashboard.dart';

import '../mydrawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'firebase_helper.dart';

class HomePage extends StatefulWidget {

  UserCredential? userCredential;

  HomePage({required this.userCredential});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Drawer(

    );
  }
}
