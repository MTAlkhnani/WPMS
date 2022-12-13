import 'package:my_app/screens/profile_screen.dart';

import 'welcome_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class CustomerScreen extends StatefulWidget {
  static const String id = 'customer_screen';
  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  final _auth = auth.FirebaseAuth.instance;
  auth.User? loggedInUser;
  String? messeageText;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

// this is how to get the current user
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              child: Text('Hello'),
            ),
            ListTile(
              title: const Text('Account Information'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, ProfileScreen.id);
              },
            ),
            ListTile(
              title: const Text('Sign out'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                _auth.signOut();
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        //leading: null,
        title: Text('Main Screen '),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[],
        ),
      ),
    );
  }
}
