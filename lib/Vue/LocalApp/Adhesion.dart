import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/LocalApp/FormulaireAdh.dart';
import 'package:flutter/material.dart';

class Adhesion extends StatelessWidget {
  const Adhesion({super.key});

  @override
  Widget build(BuildContext context) {
    double h = Media.height(context);
    double w = Media.width(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Adhésion'),
        backgroundColor: AppData.BasicColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: h,
          width: w,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Nos conditions d'adhésion",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  "Membre adhérent",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "– Etre d’origine africaine",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                ),
                Text(
                  "– Etre en accord avec le ROI et la charte",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                ),
                Text(
                  "– Cotisation : 80€ par an",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Membre effectif​",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "– Mêmes conditions que le membre adhérent",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                ),
                Text(
                  "– Faire partie du Conseil d’Administration",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Membre d'honneur​",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "– Origine africaine non requise",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                ),
                Text(
                  "– Adhérer au projet proposé par les AP",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                ),
                Text(
                  "– Aides diverses",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: h * 0.15),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FormAdh(),));
                    },
                    child: Text("J'adhére"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppData.BasicColor)
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
