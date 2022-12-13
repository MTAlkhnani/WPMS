import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WalletScreen extends StatelessWidget {
  static const String id = 'wallet_screen';
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('This is the Wallet page'),
        ),
      ),
    );
  }
}
