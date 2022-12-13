import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            elevation: 1,
            backgroundColor: const Color(0xFFF5F6F9),
            title: Text(
              'Built for your beauty',
              style: Theme.of(context).textTheme.headline1,
            ),
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
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
      ),
    );
  }
}
