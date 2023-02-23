import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
            "ArtisansMill", style: TextStyle(
            fontSize: 29,
                fontWeight: FontWeight.bold
          ),),
        ),
      ),
    );
  }
}
