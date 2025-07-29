import 'package:chat_app/resources/colors/app_colors.dart';
import 'package:chat_app/resources/roundbutton.dart';
import 'package:chat_app/view/screens/signup_view/signup.dart';
import 'package:chat_app/view/widget/nametextformfield/NameTextFormField.dart';
import 'package:chat_app/view/widget/passwordtextformfield/PasswordTextFormField.dart';

import 'package:flutter/material.dart';

import '../../widget/emailtextformfield/EmailTextFormField.dart';
import '../login_view/login.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isHidden = true;
  bool _isRemember = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            'Create Account',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            textAlign: TextAlign.center,
            'Create a new Account to get started and enjoy seamless access to our features',
          ),
          SizedBox(height: 20),
          CustomTextFieldName(hintText: 'Enter name ', controller: nameController, prefixIcon: Icon(Icons.person), labelText: 'Name'),
          SizedBox(height: 20),
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
          CustomTextFieldPassword(
            obscureText: _isHidden,
            hintText: 'Enter Confirm Password',
            controller: confirmController,
            prefixIcon: Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(_isHidden ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  _isHidden = !_isHidden;
                });
              },
            ),
            labelText: 'Confirm Password',
          ),
          SizedBox(height: 20,),
          RoundButton(
            title: 'Sign Up',
            color: AppColors.primaryColors,
            textColor: AppColors.accent,
            onTap: () {},
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account?', style: TextStyle(fontSize: 20)),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text('Sign in', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: Divider(thickness: 2),
          ),
        ],
      ),
    );
  }
}
