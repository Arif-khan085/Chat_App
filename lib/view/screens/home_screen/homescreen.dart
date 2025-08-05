import 'package:chat_app/services/auth_services.dart';
import 'package:chat_app/view/screens/login_view/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await logout();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
        backgroundColor: Colors.blue,
        title: Text('Home Screen'),
        automaticallyImplyLeading: false,
      ),
      body: Column(children: [

      ]),
    );
  }
}
