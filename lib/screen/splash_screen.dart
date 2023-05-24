import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bmi/screen/menu_screen.dart';

// import 'screen/login_register.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

@override
class _SplashScreenState extends State<SplashScreen> {
  Future splashTiming() async {
    Timer(Duration(seconds: 3), nextScreen);
  }

  void nextScreen() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => MenuScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    splashTiming();
    double Kwidth = MediaQuery.of(context).size.width;
    double Kheight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/Logo.png',
            // fit: BoxFit.cover,
            width: Kwidth * 0.6,
            height: Kheight * 0.6,
          ),
          SizedBox(
            height: 60,
          ),
          CircularProgressIndicator(
            backgroundColor: Color.fromARGB(255, 233, 5, 5),
            strokeWidth: 2.0,
          ),
        ],
      ),
    ));
  }
}
