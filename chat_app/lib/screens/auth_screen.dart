import 'package:chat_app/widgets/auth/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;

  void _submitAuthForm(
      String email,
       String password,
        String username,
         bool isLogin,
         BuildContext context
         ) async {
    UserCredential authResult;
    // Pushing Firebase in here
    try {
      if (isLogin) {
        // Existing user
        authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        // New user
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      }
    } on PlatformException catch (error) {
      var msg = 'An error occurred, please check your credentials!';
      if (error.message != null) {
        msg = error.message!;
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(msg),
        backgroundColor: Theme.of(context).errorColor,
      ));
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(
        submitFn: _submitAuthForm,
      ),
    );
  }
}
