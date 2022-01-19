import 'package:flutter/material.dart';



class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
           decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/dancing_14.jpg'),
                  fit: BoxFit.cover))),
    );
  }
}
