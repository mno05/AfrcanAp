import 'package:flutter/material.dart';
class StateCircle extends StatelessWidget {
  final bool Actif;
  const StateCircle(this.Actif,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Actif?Colors.green:Colors.grey,
      ),
    );
  }
}