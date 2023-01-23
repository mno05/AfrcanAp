import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginVue extends StatefulWidget {
  const LoginVue({super.key});

  @override
  State<LoginVue> createState() => _LoginVueState();
}

class _LoginVueState extends State<LoginVue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEB7D30),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                CupertinoIcons.arrowshape_turn_up_left,
                size: 35,
                color: Colors.white,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                  Text("Navigation flow"),
                  Container(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
