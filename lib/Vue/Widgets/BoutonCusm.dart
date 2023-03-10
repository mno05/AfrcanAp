import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:flutter/material.dart';

class ButtonCusm extends StatelessWidget {
  String text;
  bool isOther;
  void Function()? onPressed;
  ButtonCusm({super.key, required this.text, required this.onPressed,this.isOther=false});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: Media.height(context) * 0.05,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color:isOther?AppData.BasicColor: Colors.white),
        child: Center(
            child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextButton(
            style: ButtonStyle(
              overlayColor:
                  MaterialStateProperty.all(Color(0xffEB7D30).withOpacity(0.2)),
            ),
            onPressed: null,
            child: Text(
              text,
              style: TextStyle(color: Colors.black87),
            ),
          ),
        )),
      ),
    );
  }
}
