import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:flutter/material.dart';

class Compte extends StatelessWidget {
  const Compte({super.key});

  @override
  Widget build(BuildContext context) {
    double h = Media.height(context);
    double w = Media.width(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("img/profil.png"),
                  radius: h * 0.03,
                ),
                title: Text(
                  'MOISE NDJADI',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Informaticien",
                  style: TextStyle(
                    fontSize: 20,
                  color: Colors.black54,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
