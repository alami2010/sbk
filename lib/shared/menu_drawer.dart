import 'package:flutter/material.dart';
import 'package:meditation/login/login.dart';
import 'package:meditation/shared/route.dart';

import '../login/signup.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: AssetImage('assets/dancing_04.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: buildMenuItems(context),
        ),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<RouteNavigation> menuTitles = [
      RouteNavigation('Acceuil', SignupPage()),
      RouteNavigation('Se Connecter', LoginPage()),
      RouteNavigation('S\'inscrir', SignupPage()),
      RouteNavigation('Training', SignupPage()),
    ];

    final List<Widget> menuItems = [];
    menuItems.add(DrawerHeader(
      child: Text(
        'Hlobox',
        style: TextStyle(color: Colors.white, fontSize: 28),
      ),
    ));

    menuTitles.forEach((element) {
      menuItems.add(ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.white70,
          child: ListTile(
            leading: Icon(Icons.access_alarm),
            title: Text(element.name,
                style: TextStyle(fontSize: 18, color: Colors.black87)),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => element.page));
            },
          ),
        ),
      ));
    });

    return menuItems;
  }
}
