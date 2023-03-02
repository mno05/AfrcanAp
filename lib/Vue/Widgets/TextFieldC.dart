import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:flutter/material.dart';

class TextFildC extends StatelessWidget {
  final String hintText;
  String err;
  TextEditingController Tcontroller;
  bool isPassW;
  bool isEmail;
  bool isNumber;
  TextFildC(
      {super.key,
      required this.hintText,
      this.err = "",
      required this.Tcontroller,
      this.isPassW=false,
      this.isEmail=false,
      this.isNumber=false,

      });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 15),
        width: Media.width(context) * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          controller: Tcontroller,
          obscureText: isPassW?true:false,
          keyboardType: isEmail?TextInputType.emailAddress:isNumber?TextInputType.number:TextInputType.text,
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
