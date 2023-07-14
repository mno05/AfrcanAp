import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:flutter/material.dart';

class LoginTf extends StatelessWidget {
  final String hintText;
  String err;
  TextEditingController Tcontroller;
  bool isPassW;
  bool isEmail;

  LoginTf(
      {super.key,
      required this.hintText,
      this.err = "",
      required this.Tcontroller,
      this.isPassW=false,
      this.isEmail=false

      });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 15),
        width: Media.width(context) * 0.7,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextFormField(
          controller: Tcontroller,
          obscureText: isPassW?true:false,
          keyboardType: isEmail?TextInputType.emailAddress:TextInputType.text,
          validator: (value) => value!.isEmpty ? this.err : null,
          decoration: InputDecoration(
            
            hintText: hintText,
            hintMaxLines: 1,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ));
  }
}
