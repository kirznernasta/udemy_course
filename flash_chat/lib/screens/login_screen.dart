import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'Login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;

  final _auth = FirebaseAuth.instance;

  bool shouldSpin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: shouldSpin,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                onChanged: (value) {
                  email = value;
                },
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                color: Colors.lightBlueAccent,
                title: 'Log In',
                function: () async {
                  setState(() {
                    shouldSpin = true;
                  });
                  try {
                    final userCredential =
                        await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                    setState(() {
                      shouldSpin = false;
                    });
                    Navigator.pushNamed(context, ChatScreen.id);
                  } catch (e) {
                    print('EXCEPTION: $e');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
