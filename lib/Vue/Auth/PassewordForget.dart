import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/Auth/Inscription.dart';
import 'package:african_ap/Vue/Auth/LoginVue.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:african_ap/Vue/Widgets/BoutonC.dart';
import 'package:african_ap/Vue/Widgets/TxtFC.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class PasswordForget extends StatefulWidget {
  const PasswordForget({super.key});
  @override
  State<PasswordForget> createState() => _PasswordForgetState();
}

class _PasswordForgetState extends State<PasswordForget> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }

  final _key = GlobalKey<FormState>();
  TextEditingController emailTelephone = TextEditingController();
  TextEditingController passW = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h = Media.height(context);
    double w = Media.width(context);
    ToastContext().init(context);
    return Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("img/image_back.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        height: h / 8,
                        child: Image.asset("img/logo.png"),
                      ),
                    ],
                  ),
                  SizedBox(height: h / 45),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: w * .05),
                        height: h / 10,
                        child: Text(
                          "Mot de passe oublié",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: w / 15),
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: _key,
                    child: Column(
                      children: [
                        TxtFc(
                          icon: Icons.mail,
                          hintText: "Entrez votre adresse e-mail",
                          Tcontroller: emailTelephone,
                          isEmail: true,
                          err: "Entrez votre adresse e-mail",
                        ),
                        SizedBox(height: h / 50),
                        ButtonC(
                          text: "Continuer",
                          onPressed: () async {
                            BasicsWidgets.Load(context);
                            if (_key.currentState!.validate()) {
                              try {
                                await FirebaseAuth.instance
                                    .sendPasswordResetEmail(
                                  email: emailTelephone.text,
                                )
                                    .then((value) {
                                  BasicsWidgets.alertWithOkAction(
                                      "Nous vous avons envoyez un lien pour réinitialiser votre mot de passe\nVeuillez vous connectez à votre compte et cliquer sur le lien que nous avons envoyé",
                                      context, () async {
                                    const String url =
                                        "https://mail.google.com/mail/u/0/#inbox/";
                                    if (await canLaunch(url)) {
                                      await launch(url).then((value) =>  Get.offAll(() => const LoginVue()));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Impossible d'ouvrir Gmail")),
                                      );
                                    }
                                  });
                                });
                              } catch (e) {}
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Nouveau chez AP ?  "),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Inscription(),
                      ));
                },
                child: Text(
                  "Créez un compte",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppData.BasicColorNew,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
