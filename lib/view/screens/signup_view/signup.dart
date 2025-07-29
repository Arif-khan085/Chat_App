import 'package:chat_app/resources/colors/app_colors.dart';
import 'package:chat_app/resources/roundbutton.dart';
import 'package:chat_app/view/widget/passwordtextformfield/PasswordTextFormField.dart';

import 'package:flutter/material.dart';

import '../../widget/emailtextformfield/EmailTextFormField.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isHidden = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          CustomTextFieldEmail(
            hintText: 'Enter Email',
            labelText: 'Email',
            prefixIcon: Icon(Icons.email),
            controller: emailController,
          ),
          SizedBox(height: 20),
          CustomTextFieldPassword(
            obscureText: _isHidden,
            hintText: 'Enter Password',
            controller: passwordController,
            prefixIcon: Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(_isHidden ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  _isHidden = !_isHidden;
                });
              },
            ),
            labelText: 'Password',
          ),
          SizedBox(height: 20),
          RoundButton(
            title: 'Login',
            color: AppColors.primaryColors,
            textColor: AppColors.accent,
            onTap: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Do not have and account?', style: TextStyle(fontSize: 20)),
              TextButton(
                onPressed: () {},
                child: Text('Sign Up', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
