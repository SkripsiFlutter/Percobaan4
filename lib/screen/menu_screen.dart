import 'package:flutter/material.dart';
import 'package:flutter_bmi/screen/bmi_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/button_widget.dart';
// import 'package:flutter_gym_management_system/widget/textbutton_widget.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Logo.png',
              height: 150.0,
            ),
            Text(
              'Cek Kesehatanmu Menggunakan Kalkulator',
              style: GoogleFonts.robotoCondensed(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30.0),
            ButtonWidget(
                text: 'Kalkulator IMT',
                onClicked: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return BmiScreen();
                  }));
                }),
            SizedBox(height: 20.0),
            ButtonWidget(
                text: 'Rekomendasi Kesehatan',
                onClicked: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return BmiScreen();
                  }));
                }),
            SizedBox(height: 20.0),
            ButtonWidget(
                text: 'Berita Kesehatan',
                onClicked: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return BmiScreen();
                  }));
                }),
            SizedBox(height: 20.0),
            ButtonWidget(
                text: 'Tentang Aplikasi',
                onClicked: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return BmiScreen();
                  }));
                }),
            SizedBox(height: 80.0),
          ],
        ),
      )),
    );
  }
}
