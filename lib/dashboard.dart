import 'package:flutter/material.dart';
import 'package:login_firebase/mydrawer.dart';
import '../homepage.dart';

import 'firebase_helper.dart';
import 'homepage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text("Dashboard"),
        actions: [
          IconButton(
              onPressed: (){
            FirebaseHelper.instance.signOutUser();
            print("SignOut Successfully...");
            SnackBar(
              content: Text("SignOut Successful...."),
            );
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (route) => false);
          }, icon: Icon(Icons.power_settings_new))
        ],
      ),
      drawer: MyDrawer(userCredential: args ,),
    );
  }
}
