import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/Auth/Inscription.dart';
import 'package:african_ap/Vue/Widgets/BoutonCusm.dart';
import 'package:african_ap/Vue/Widgets/LoginTextField.dart';
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
          padding: const EdgeInsets.only(left: 20.0, top: 25, right: 20),
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
                    radius: 45,
                    child: Text("LOGO"),
                  ),
                  SizedBox(height: Media.height(context) * 0.03),
                  Text(
                    "Navigation flow",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: Media.height(context) * 0.03),
                  Container(
                    height: Media.height(context) * 0.6,
                    width: Media.width(context),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoginTf(
                          hintText: "Nom/Téléphone",
                        ),
                        SizedBox(
                          height: Media.height(context) * 0.02,
                        ),
                        LoginTf(
                          hintText: "Mot de passe",
                        ),
                        SizedBox(height: Media.height(context) * 0.03),
                        ButtonCusm(
                          text: "Connexion",
                          onPressed:(){},
                        ),
                        SizedBox(height: Media.height(context) * 0.02),
                        ButtonCusm(
                          text: "Inscrription",
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Inscription(),));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
