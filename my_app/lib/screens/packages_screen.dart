import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PackagesScreen extends StatelessWidget {
  static const String id = 'packages_screen';
  const PackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('This is the packages page'),
        ),
      ),
    );
  }
}
