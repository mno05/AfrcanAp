import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:flutter/material.dart';

class ButtonC extends StatelessWidget {
  String text;
  bool isOther;
  void Function()? onPressed;
  ButtonC(
      {super.key,
      required this.text,
      required this.onPressed,
      this.isOther = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: Media.height(context) * 0.07,
        // padding: EdgeInsets.only(left: 15),
        width: Media.width(context) * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isOther ? AppData.BasicColor : AppData.BasicColorNew),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
