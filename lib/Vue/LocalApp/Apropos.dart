import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Apropos extends StatelessWidget {
  const Apropos({super.key});

  @override
  Widget build(BuildContext context) {
    double h = Media.height(context);
    double w = Media.width(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Apropos'),
        backgroundColor: AppData.BasicColor,
      ),
      body: Container(
        color: Colors.white54,
        height: h,
        width: w,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "AfricanAP",
                style: GoogleFonts.nunito(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Version 1.0.0",
                style: GoogleFonts.nunito(
                  fontSize: 15,
                ),
              ),
              Container(
                // height: h*.5,
                width: w * .35,
                child: Image.asset("img/logo.png"),
              ),
              SizedBox(height: 15),
              Text(
                "©2023 Möglich Company",
                style: GoogleFonts.nunito(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
