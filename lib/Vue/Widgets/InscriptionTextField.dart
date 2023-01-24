import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class InscriptionTf extends StatelessWidget {
  final String hintText;
  final bool isNumber;
  const InscriptionTf(
      {super.key, required this.hintText, this.isNumber = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:isNumber?
        EdgeInsets.only(left:8)
        :EdgeInsets.only(left: 15),
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
        child: isNumber
            ? InternationalPhoneNumberInput(
                onInputChanged: (value) {},
                textStyle: TextStyle(
                  color: Colors.white,
                ),
                inputBorder: InputBorder.none,
                cursorColor: Colors.white,
                formatInput: false,
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                inputDecoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Téléphone",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            : TextFormField(
              
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
}
