import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class InscriptionTf extends StatelessWidget {
  final String hintText;
  final bool isNumber;
  String err;
  TextEditingController Tcontroller;
  bool isPassW;
  bool isEmail;
  InscriptionTf(
      {super.key,
      required this.hintText,
      this.isNumber = false,
      this.err = "",
      required this.Tcontroller,
      this.isPassW = false,
      this.isEmail = false});
  String numero = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            isNumber ? EdgeInsets.only(left: 8) : EdgeInsets.only(left: 15),
        margin: EdgeInsets.only(bottom: 6),
        width: Media.width(context) * 0.7,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextFormField(
          style: TextStyle(
            color: Colors.white,
            // fontWeight: FontWeight.bold,
          ),
          controller: Tcontroller,
          validator: (value) => value!.isEmpty ? this.err : null,
          obscureText: isPassW ? true : false,
          keyboardType:
              isEmail ? TextInputType.emailAddress : TextInputType.text,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.white,
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ));
  }

  String getNumero() {
    return numero;
  }
}
