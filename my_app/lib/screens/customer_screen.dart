import 'package:another_stepper/widgets/vertical_stepper.dart';
import 'package:my_app/screens/package_state.dart';
import 'package:my_app/screens/packages_screen.dart';
import 'package:my_app/screens/profile_screen.dart';
import 'package:my_app/screens/wallet_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:another_stepper/another_stepper.dart' as step;
import '../components/My_Card.dart';
import '../components/RoundedButton.dart';
import '../components/app_drawer.dart';
import 'welcome_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as db;

class CustomerScreen extends StatefulWidget {
  static const String id = 'customer_screen';

  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen>
    with TickerProviderStateMixin {
  final _auth = auth.FirebaseAuth.instance;
  final _firestore = db.FirebaseFirestore.instance;
  auth.User? loggedInUser;
  String? messeageText;
  bool result = false;
  List<step.StepperData> steps = [
    step.StepperData(
      title: step.StepperText(
        "Order Phjf",
        textStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
      subtitle: step.StepperText("Your order has been placed"),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: const Icon(Icons.navigate_next_sharp, color: Colors.white),
      ),
    ),
    step.StepperData(
      title: step.StepperText(
        "Order Placed",
        textStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
      subtitle: step.StepperText("Your order has been placed"),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: const Icon(Icons.navigate_next_sharp, color: Colors.white),
      ),
    ),
    step.StepperData(
      title: step.StepperText(
        "Order Placed",
        textStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
      subtitle: step.StepperText("Your order has been placed"),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: const Icon(Icons.navigate_next_sharp, color: Colors.white),
      ),
    ),
    step.StepperData(
      title: step.StepperText(
        "Order Placed",
        textStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
      subtitle: step.StepperText("Your order has been placed"),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: const Icon(Icons.navigate_next_sharp, color: Colors.white),
      ),
    ),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getPackages() async {
    await for (var snapshot in _firestore.collection('packages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data().cast());
      }
    }
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
        child: AppDrawer(
            // Important: Remove any padding from the ListView.
            // padding: EdgeInsets.zero,
            // children: [
            //   DrawerHeader(
            //     decoration: BoxDecoration(
            //       color: Colors.lightBlueAccent,
            //     ),
            //     child: Text('Hello'),
            //   ),
            //   ListTile(
            //     title: const Text('Account Information'),
            //     onTap: () {
            //       // Update the state of the app
            //       // ...
            //       // Then close the drawer
            //       Navigator.pushNamed(context, ProfileScreen.id);
            //     },
            //   ),
            //   ListTile(
            //     title: const Text('Sign out'),
            //     onTap: () {
            //       // Update the state of the app
            //       // ...
            //       // Then close the drawer
            //       _auth.signOut();
            //       Navigator.pop(context);
            //       Navigator.pop(context);
            //     },
            //   ),
            // ],
            ),
      ),
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        //leading: null,
        title: Text('Packages'),
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Icon(
                FontAwesomeIcons.plus,
              ),
              onTap: () {
                Navigator.pushNamed(context, PackagesScreen.id);
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(child: content()),
    );
  }

  Widget content() {
    return Column(
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT6Yc_N3xC9akfMD4yRs9kwCBKoaRrie9z-Rg&usqp=CAU',
                    height: 200,
                  ),
                  Text(
                    'Package Tracker',
                    style: TextStyle(fontSize: 30),
                  )
                ],
              ),
            ),
          ),
        ),
        body()
      ],
    );
  }

  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35.0),
          child: Text(
            'Tracker Number:',
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
          child: Row(
            children: [
              Container(
                width: 310,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'e.g. #12345678'),
                  onChanged: (value) {
                    getPackages();
                  },
                ),
              ),
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                child: Icon(
                  Icons.search,
                  size: 25,
                ),
                onTap: () {
                  setState(() {
                    result = true;
                  });
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(35, 2, 31, 0),
          child: Row(
            children: [
              Text(
                'Result:',
                style: TextStyle(fontSize: 25),
              ),
              Spacer(),
              GestureDetector(
                child: Icon(
                  Icons.close,
                  size: 25,
                ),
                onTap: () {
                  setState(() {
                    result = false;
                  });
                },
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        result
            ? Padding(
                padding: const EdgeInsets.fromLTRB(35, 2, 31, 0),
                child: step.AnotherStepper(
                  stepperList: steps,
                  stepperDirection: Axis.vertical,
                  inverted: false,
                  activeBarColor: Colors.red,
                  inActiveBarColor: Colors.grey,
                  activeIndex: 2,
                ),
              )
            : Lottie.network(
                'https://assets2.lottiefiles.com/packages/lf20_t24tpvcu.json')
      ],
    );
  }
}
