import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);
  final _auth = auth.FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            elevation: 1,
            backgroundColor: const Color(0xFFF5F6F9),
            centerTitle: true,
            automaticallyImplyLeading: false, // back button: false
          ),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Product Page'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Orders'),
            onTap: () {
              /* Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName); */
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Products Manager'),
            onTap: () {
              // Navigator.of(context)
              //     .pushReplacementNamed(ProductsManager.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              _auth.signOut();
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
