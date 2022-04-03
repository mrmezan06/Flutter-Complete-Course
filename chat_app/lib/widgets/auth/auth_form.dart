import 'package:flutter/material.dart';
class AuthForm extends StatefulWidget {
  const AuthForm({ Key? key }) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email address',
                        ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Username'
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 12,),
                    ElevatedButton(
                      child: const Text('Login', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        )),
                      onPressed: (() {
                      
                        }),
                        ),
                    TextButton(
                      onPressed: (){},
                      child: const Text('Create new account'))
                ]),
              ),
            ),
          ),
        ));
  }
}