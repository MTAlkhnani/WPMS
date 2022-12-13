import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:flutter/material.dart';

import '../components/RoundedButton.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                child: Text(
                  'WPMS 📦',
                  style: TextStyle(
                      fontSize: 42.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 60.0,
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              btnName: 'Log in',
              color: Colors.lightBlueAccent,
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
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
