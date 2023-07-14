
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:flutter/material.dart';

class TxtFc extends StatefulWidget {
  final String hintText;
  String err;
  TextEditingController Tcontroller;
  bool isPassW;
  bool isEmail;
  bool isNumber;
  IconData icon;
  TxtFc({
    super.key,
    required this.hintText,
    this.err = "",
    required this.Tcontroller,
    this.isPassW = false,
    this.isEmail = false,
    this.isNumber = false,
    required this.icon,
  });

  @override
  State<TxtFc> createState() => _TxtFcState();
}

class _TxtFcState extends State<TxtFc> {
  FocusNode focus = FocusNode();
  late bool isObsure;
  @override
  void initState() {
    super.initState();
    isObsure = widget.isPassW;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Media.height(context) * 0.08,
        padding: EdgeInsets.only(left: 15),
        width: Media.width(context) * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: TextFormField(
            controller: widget.Tcontroller,
            obscureText: isObsure,

            keyboardType: widget.isEmail
                ? TextInputType.emailAddress
                : widget.isNumber
                    ? TextInputType.number
                    : TextInputType.text,
            validator: (value) => value!.isEmpty ? this.widget.err : null,
            decoration: InputDecoration(
              
              icon: Icon(widget.icon),
              suffixIconColor: Colors.grey,
              suffixIcon: widget.isPassW
                  ? IconButton(
                      icon: Icon(isObsure?Icons.remove_red_eye_outlined:Icons.remove_red_eye_sharp),
                      onPressed: () {
                        setState(() {
                          isObsure=!isObsure;
                        });
                      },
                    )
                  : Container(
                    height: 10,
                    width: 10,
                  ),
              hintText: widget.hintText,
              hintMaxLines: 1,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusColor: Colors.grey,
              fillColor: Colors.grey,
              focusedErrorBorder: InputBorder.none,
              
            ),
          ),
        ));
  }
}
