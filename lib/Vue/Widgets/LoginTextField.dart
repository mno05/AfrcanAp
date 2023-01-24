import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:flutter/material.dart';

class LoginTf extends StatelessWidget {
  final String hintText;
  const LoginTf({super.key,required this.hintText,});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      width: Media.width(context)*0.7,
      decoration: BoxDecoration(
      color: Colors.white,
          borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintMaxLines: 1,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    ));
  }
}