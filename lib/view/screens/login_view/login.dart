import 'package:chat_app/resources/colors/app_colors.dart';
import 'package:chat_app/resources/roundbutton.dart';
import 'package:chat_app/services/auth_services.dart';
import 'package:chat_app/view/screens/signup_view/signup.dart';
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
  bool _isRemember = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
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
          SizedBox(height: 20),
          Text(
            'Login',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            textAlign: TextAlign.center,
            'Enter Your Email And Password to securely Access your Account and manage your services',
          ),
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
          RoundButton(
            title: 'Sign In',
            color: AppColors.primaryColors,
            textColor: AppColors.accent,
            onTap: () {
              if(emailController.text.isEmpty&&passwordController.text.isEmpty){
                setState(() {
                  isLoading=true;
                });
                login(emailController.text, passwordController.text).then((user){
                  if(user  != null){
                    print('Login Successfully');
                    setState(() {
                      isLoading = false;
                    });
                  }else{
                    print('Login failed');
                    setState(() {
                      isLoading=false;
                    });
                  }
                });
              }else{
                print('please fill form correctly');
              }
            },
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: _isRemember,
                    onChanged: (bool? _newValue) {
                      setState(() {
                        _isRemember = _newValue!;
                      });
                    },
                  ),
                  Text('Remember Me', style: TextStyle(fontSize: 18)),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text('Forget Password', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Do not have an account?', style: TextStyle(fontSize: 20)),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                child: Text('Sign Up', style: TextStyle(fontSize: 20)),
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
