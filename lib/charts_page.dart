import 'package:flutter/material.dart';


class ChartsPage extends StatelessWidget {
  const ChartsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/dancing_16.jpg'),
                  fit: BoxFit.cover))),
    );
  }
}
