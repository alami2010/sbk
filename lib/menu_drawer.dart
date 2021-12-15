import 'package:flutter/material.dart';

import 'detail_page.dart';
import 'login/login.dart';
import 'login/signup.dart';

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
    final List<String> menuTitles = [
      'Acceuil',
      'Se Connecter',
      'S\'inscrir',
      'Training'
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

            title: Text(element,
                style: TextStyle(
                     fontSize: 18,
                    color: Colors.black87)),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SignupPage()));
            },
          ),
        ),
      ));
    });

    return menuItems;
  }
}
