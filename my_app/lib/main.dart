import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_app/screens/package_screen.dart';
import 'package:my_app/screens/packages_screen.dart';
import 'package:my_app/screens/profile_screen.dart';
import 'package:my_app/screens/wallet_screen.dart';

import 'screens/customer_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/welcome_screen.dart';

void main() async {
  // Ensure that Firebase is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // // Initialize Firebase
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: WelcomeScreen.id, routes: {
      WelcomeScreen.id: (context) => WelcomeScreen(),
      LoginScreen.id: (context) => LoginScreen(),
      RegistrationScreen.id: (context) => RegistrationScreen(),
      CustomerScreen.id: (context) => CustomerScreen(),
      ProfileScreen.id: (context) => ProfileScreen(),
      PackagesScreen.id: (context) => PackagesScreen(),
      PackageScreen.id: (context) => PackageScreen(),
      WalletScreen.id: (context) => WalletScreen(),
    });
  }
}
