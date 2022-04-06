import 'dart:io';

import 'package:chat_app/widgets/auth/auth_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthForm(String email, String password, String username,
      File image, bool isLogin, BuildContext context) async {
    UserCredential authResult;
    // Pushing Firebase in here
    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        // Existing user
        authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        // Get PlayerID for OneSignal
        var deviceState = await OneSignal.shared.getDeviceState();

          if (deviceState == null || deviceState.userId == null) {
            return;
          }

          var playerId = deviceState.userId!;

          // Onesignal Id End

        // New user
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        //Image Upload Section Start
        final ref = FirebaseStorage.instance
            .ref()
            .child('user_image')
            .child(authResult.user!.uid + '.jpg');
        await ref.putFile(image).whenComplete(
            () => null);

        final url = await ref.getDownloadURL();

        print(url);

        //Image Upload Section End
        FirebaseFirestore.instance
            .collection('users')
            .doc(authResult.user!.uid)
            .set({
          'username': username,
          'email': email,
          'image_url': url.toString(),
          'onesignalId': playerId,
        });
      }
    } on PlatformException catch (error) {
      var msg = 'An error occurred, please check your credentials!';
      if (error.message != null) {
        msg = error.message!;
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(msg),
        backgroundColor: Theme.of(context).primaryColorDark,
      ));
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
        backgroundColor: Theme.of(context).errorColor,
      ));
      print(error);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(
        submitFn: _submitAuthForm,
        isLoading: _isLoading,
      ),
    );
  }
}
