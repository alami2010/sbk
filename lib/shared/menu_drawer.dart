import 'package:flutter/material.dart';
import 'package:go_dance/login/login.dart';
import 'package:go_dance/profil/authPage.dart';
import 'package:go_dance/shared/route.dart';

import '../login/signup.dart';
import '../map.dart';

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
      RouteNavigation('S\'inscrir', AuthPage(isLogin: true)),
      RouteNavigation('Trainingx', AuthPage(isLogin: false)),
      RouteNavigation('Map', MapSample()),
    ];

    final List<Widget> menuItems = [];
    menuItems.add(DrawerHeader(child: Image.asset('assets/logo2.png')));

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
