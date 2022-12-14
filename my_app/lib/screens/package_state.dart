import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/components/RoundedButton.dart';

class PackagesState extends StatefulWidget {
  const PackagesState({super.key});
  static const String id = 'package_state';
  @override
  State<PackagesState> createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackagesState> {
  @override
  List updatePackages() {
    final List _listOfPackages = [
      'Package 1',
      'Package 2',
      'Package 3',
      'Package 1',
      'Package 2',
      'Package 3',
      'Package 1',
      'Package 2',
      'Package 3',
      'Package 1',
      'Package 2',
      'Package 3',
    ];
    return _listOfPackages;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: updatePackages().length * 2,
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd)
          return const Divider(
            thickness: 1.5,
          ); /*2*/
        final index = i ~/ 2; /*3*/
        return ListTile(
            title: Text(
              updatePackages()[index],
              style: TextStyle(fontSize: 16),
            ),
            trailing: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {},
                  minWidth: 75.0,
                  height: 42.0,
                  child: Text(
                    'Send',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
