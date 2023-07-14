import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Services/Auth.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/Auth/Inscription.dart';
import 'package:african_ap/Vue/Auth/PassewordForget.dart';
import 'package:african_ap/Vue/Widgets/BoutonC.dart';
import 'package:african_ap/Vue/Widgets/ChangePage.dart';
import 'package:african_ap/Vue/Widgets/TxtFC.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:toast/toast.dart';

class LoginVue extends StatefulWidget {
  const LoginVue({super.key});
  @override
  State<LoginVue> createState() => _LoginVueState();
}

class _LoginVueState extends State<LoginVue> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
   setValue("isFirst",true);
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
                          "Bienvenue sur My AP",
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
                          hintText: "E-mail",
                          Tcontroller: emailTelephone,
                          isEmail: true,
                          err: "Entrez votre adresse e-mail",
                        ),
                        SizedBox(height: h / 45),
                        TxtFc(
                          icon: FontAwesomeIcons.lock,
                          hintText: "Mot de passe",
                          Tcontroller: passW,
                          err: "Entrez votre mot de passe",
                          isPassW: true,
                        ),
                        SizedBox(height: h / 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: h / 10,
                              child: InkWell(
                                onTap: () {
                                  ChangePage.SliderPush(
                                      context: context, push: PasswordForget());
                                },
                                child: Text(
                                  "Mot de passe oublié?",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        ButtonC(
                          text: "Connexion",
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              // LoginController.UserLogin(
                              //   context,
                              //   UserM(
                              //     prenom: "",
                              //     nom: "",
                              //     telephone: "",
                              //     email: emailTelephone.text,
                              //     passw: passW.text,
                              //     imageName: "",
                              //     imageData: File(""),
                              //   ),
                              // );
                              AuthServices().Login(context, emailTelephone.text, passW.text);
                              // dbServices().FromCacheOrFromServer();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: h / 25),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Container(
                  //       height: 0.4,
                  //       color: Colors.black54,
                  //       width: w / 4,
                  //     ),
                  //     Container(
                  //       child: Text(
                  //         "Connectez-vous avec",
                  //         style: TextStyle(
                  //           color: Colors.black54,
                  //         ),
                  //       ),
                  //     ),
                  //     Container(
                  //       height: 0.4,
                  //       color: Colors.black54,
                  //       width: w / 4,
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: h / 50),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Container(
                  //       height: h / 15,
                  //       width: w / 3,
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //           width: 1,
                  //           color: Colors.black54,
                  //         ),
                  //         borderRadius: BorderRadius.circular(8),
                  //       ),
                  //       child: Center(
                  //         child: Row(
                  //           crossAxisAlignment: CrossAxisAlignment.center,
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Container(
                  //               height: 40,
                  //               width: 40,
                  //               child: Image.asset("img/google_logo.webp"),
                  //             ),
                  //             Text("Google"),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: h / 45),
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





              // child: Padding(
              //   padding: const EdgeInsets.only(left: 20.0, top: 25, right: 20),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //         mainAxisAlignment: MainAxisAlignment.start,

              //     children: [
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           Container(
              //             height: h/10,
              //             // backgroundColor: Colors.white,
              //             // radius: 45,
              //             child: Image.asset(),
              //           ),
              //           SizedBox(height: Media.height(context) * 0.03),
              //           SizedBox(height: Media.height(context) * 0.03),
              //           Container(
              //             height: Media.height(context) * 0.6,
              //             width: Media.width(context),
              //             decoration: BoxDecoration(
              //               border: Border.all(
              //                 color: Colors.white,
              //                 width: 2,
              //               ),
              //               borderRadius: BorderRadius.circular(25),
              //             ),
              //             child: Form(
              //               key: _key,
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   LoginTf(
              //                     Tcontroller: emailTelephone,
              //                     hintText: "Email/Téléphone",
              //                     err:
              //                         "Veuillez entrer un e-mail ou téléphone SVP",
              //                   ),
              //                   SizedBox(
              //                     height: Media.height(context) * 0.02,
              //                   ),
              //                   LoginTf(
              //                     Tcontroller: passW,
              //                     hintText: "Mot de passe",
              //                     err: "Veuillez mettre un mot de passe",
              //                     isPassW: true,
              //                   ),
              //                   SizedBox(height: Media.height(context) * 0.03),
              //                   Container(
              //                     padding: EdgeInsets.all(2),
              //                     child: Row(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.spaceAround,
              //                       children: [
              //                         IconButton(
              //                           onPressed: () {
              //                             SignWith.google();
              //                           },
              //                           // icon: Image.asset('img/google_logo.webp'),
              //                           icon: Icon(
              //                             FontAwesomeIcons.google,
              //                             size: 40,
              //                           ),

              //                           iconSize: 55,
              //                           style: ButtonStyle(
              //                             backgroundColor:
              //                                 MaterialStateProperty.all(
              //                                     Colors.white),
              //                           ),
              //                         ),
              //                         IconButton(
              //                             onPressed: () {},
              //                             icon: Icon(FontAwesomeIcons.facebook),

              //                             // icon: Icon(Icons.facebook,
              //                             //     color: Colors.blue),
              //                             iconSize: 50),
              //                         IconButton(
              //                           onPressed: () {},
              //                           // icon: Image.asset('img/linkedin.png'),
              //                           icon: Icon(FontAwesomeIcons.linkedinIn),
              //                           iconSize: 47,
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                   SizedBox(height: Media.height(context) * 0.03),
              //                   ButtonCusm(
              //                     text: "Connexion",
              //                     onPressed: () {
              //                       if (_key.currentState!.validate()) {
              //                         LoginController.UserLogin(
              //                           context,
              //                           User(
              //                             prenom: "",
              //                             nom: "",
              //                             telephone: "",
              //                             email: emailTelephone.text,
              //                             passw: passW.text,
              //                             imageName: "",
              //                             imageData: File(""),
              //                           ),
              //                         );
              //                       }
              //                     },
              //                   ),
              //                   SizedBox(height: Media.height(context) * 0.02),
              //                   ButtonCusm(
              //                     text: "Inscription",
              //                     onPressed: 
              //                     },
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),