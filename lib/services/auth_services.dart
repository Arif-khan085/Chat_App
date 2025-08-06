import 'package:cloud_firestore/cloud_firestore.dart';
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
      await user.updateDisplayName(name);
      await user.reload();
      final updatedUser = _auth.currentUser;

      await saveUser(updatedUser!,name: name);
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

Future<void>  saveUser(User user, {String? name})async {
  //to make a collection in firestore
  final ref = FirebaseFirestore.instance.collection("User").doc(user.uid);

  final snapshot = await ref.get();
  if(!snapshot.exists){
    //naming
    final fallName = name ??
  user.displayName?.trim() ??
  user.email?.split("@").first ??
  "User_${user.uid.substring(0, 5)}";

    await ref.set({
      "uid" : user.uid,
      "name" : fallName,
      "email" : user.email ?? "no email",
      "createdAt" : FieldValue.serverTimestamp(),
    });
  }
}

