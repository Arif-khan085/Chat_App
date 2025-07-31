import 'package:firebase_auth/firebase_auth.dart';

/// Create Account
Future<User?> createAccount(
  String name,
  String email,
  String password,
  String confirmPassword,
) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User? user = (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    )).user;
    if (user != null) {
      print('Account Created successfully');
      return user;
    } else {
      print('Account Create failed');
      return user;
    }

  }
  catch (e) {
    print(e);
    return null;
  }
}

/// Login
Future<User?> login(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    User? user = (await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    )).user;
    if (user != null) {
      print('Login Success');
      return user;
    } else {
      print('Login Filed');
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

/// Logout
Future logout() async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    await _auth.signOut();
  } catch (e) {
    print(e);
  }
}
