import 'package:flutter/material.dart';
import 'customer_screen.dart';
import '../components/RoundedButton.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = auth.FirebaseAuth.instance;
  bool showSpinner = false;
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Hero(
            //   tag: 'logo',
            //   child: Container(
            //     height: 200.0,
            //     child: Image.asset(''),
            //   ),
            // ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: kDecoration,
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration: kDecoration.copyWith(hintText: 'Enter your password'),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              onPressed: () async {
                setState(() {
                  showSpinner = true;
                });
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if (newUser != null) {
                    Navigator.pushNamed(context, CustomerScreen.id);
                    showSpinner = false;
                  }
                } catch (e) {
                  print(e);
                }
              },
              btnName: 'Register',
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
