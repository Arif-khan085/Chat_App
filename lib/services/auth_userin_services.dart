
import 'package:chat_app/view/screens/home_screen/homescreen.dart';
import 'package:chat_app/view/screens/login_view/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
   Authenticate({super.key});

  @override
  Widget build(BuildContext context) {
    if(_auth.currentUser != null){
      return Homescreen();
    }else{
      return LoginScreen();
    }
  }
}
