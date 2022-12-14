import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/screens/package_state.dart';

class PackagesScreen extends StatelessWidget {
  static const String id = 'packages_screen';
  const PackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Send Packages'),
        ),
        body: const Center(
          child: PackagesState(),
        ),
      ),
    );
  }
}
