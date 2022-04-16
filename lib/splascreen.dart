import 'dart:async';

// import 'package:brts/homepage.dart';
import '../signin.dart';
import 'package:flutter/material.dart';

class Splasscreen extends StatefulWidget {
  const Splasscreen({Key? key}) : super(key: key);

  @override
  _SplasscreenState createState() => _SplasscreenState();
}

class _SplasscreenState extends State<Splasscreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => signIn()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFB71C1C),
    );
  }
}
