import 'dart:convert';
import 'dart:io';
import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Services/Auth.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/Auth/LoginVue.dart';
import 'package:african_ap/Vue/Widgets/BoutonC.dart';
import 'package:african_ap/Vue/Widgets/TxtFC.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:toast/toast.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  TextEditingController prenom = TextEditingController();
  TextEditingController nom = TextEditingController();
  TextEditingController email = TextEditingController();
  late PhoneNumber telephone;
  TextEditingController passw = TextEditingController();
  TextEditingController conPassW = TextEditingController();
  final _key = GlobalKey<FormState>();

  //Variables fonction  pour l'imageProfil

  PhoneNumber pn = PhoneNumber(
    dialCode: "243",
    isoCode: "243",
  );

  XFile? _imageFile;
  ImagePicker _imagePicker = ImagePicker();
  late String imgdata;
  String imgName = "";
  File img = File("");
  takePhoto(ImageSource source) async {
    final pickedfile = await _imagePicker.pickImage(source: source);
    setState(() {
      _imageFile = pickedfile;
      img = File(_imageFile!.path);
      imgName = _imageFile!.path.split("/").last;
      imgdata = base64Encode(img.readAsBytesSync());
    });
  }

//Inscription Méthode

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    double h = Media.height(context);
    double w = Media.width(context);
    return Container(
      height: Media.height(context),
      width: Media.width(context),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("img/image_back.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: h / 12,
                            child: Image.asset("img/logo.png"),
                          ),
                        ],
                      ),
                      SizedBox(height: h / 80),
                      Text(
                        "Création de compte",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: w / 15),
                      ),
                      ImageProfil(),
                      Form(
                        key: _key,
                        child: Column(
                          children: [
                            TxtFc(
                              icon: Icons.person,
                              hintText: "Prénom",
                              Tcontroller: prenom,
                              err: "Entrez votre prénom",
                            ),
                            SizedBox(height: h / 80),
                            TxtFc(
                              icon: Icons.person,
                              hintText: "Nom",
                              Tcontroller: nom,
                              err: "Entrez votre nom",
                            ),
                            SizedBox(height: h / 80),
                            TxtFc(
                              icon: Icons.mail,
                              hintText: "E-mail",
                              Tcontroller: email,
                              isEmail: true,
                              err: "Entrez votre adresse e-mail",
                            ),
                            SizedBox(height: h / 80),
                            TxtFc(
                              icon: FontAwesomeIcons.lock,
                              hintText: "Mot de passe",
                              Tcontroller: passw,
                              err: "Entrer un mot de passe",
                              isPassW: true,
                            ),
                            SizedBox(height: h / 80),
                            TxtFc(
                              icon: FontAwesomeIcons.lock,
                              hintText: "Confirmation mot de passe",
                              Tcontroller: conPassW,
                              err: "Confirmer le mot de passe",
                              isPassW: true,
                            ),
                            SizedBox(height: h / 80),
                            ButtonC(
                              text: "S'enregistrer",
                              onPressed: () {
                                if (_key.currentState!.validate()) {
                                  if (passw.text == conPassW.text) {
                                    // ChangePage.SliderPush(
                                    //     context: context,
                                    //     push: RecupOTPInscrip(
                                    //       user: UserM(
                                    //         prenom: prenom.text,
                                    //         nom: nom.text,
                                    //         telephone: "Vide",
                                    //         email: email.text,
                                    //         passw: passw.text,
                                    //         imageName: imgName,
                                    //         imageData: img,
                                    //       ),
                                    //     ));
                                    AuthServices().register(
                                        context,
                                        UserM(
                                          prenom: prenom.text,
                                          nom: nom.text,
                                          adresseMail: email.text,
                                          isLambda: true,
                                          imagePath: imgName,
                                          imageData: img,
                                          passW: passw.text
                                        ));
                                  } else {
                                    Toast.show(
                                      "Le mot de passe diffère sa confirmation",
                                    );
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(height: h / 25),
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
                      //         "Enregistrez-vous avec",
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
                      // // SizedBox(height: h / 50),
                      // // Row(
                      // //   mainAxisAlignment: MainAxisAlignment.end,
                      // //   children: [
                      // //     Container(
                      // //       height: h / 15,
                      // //       width: w / 3,
                      // //       decoration: BoxDecoration(
                      // //         border: Border.all(
                      // //           width: 1,
                      // //           color: Colors.black54,
                      // //         ),
                      // //         borderRadius: BorderRadius.circular(8),
                      // //       ),
                      // //       child: Center(
                      // //           child: Padding(
                      // //         padding: const EdgeInsets.all(8.0),
                      // //         child: Row(
                      // //           crossAxisAlignment: CrossAxisAlignment.center,
                      // //           mainAxisAlignment: MainAxisAlignment.center,
                      // //           children: [
                      // //             Container(
                      // //               height: 40,
                      // //               width: 40,
                      // //               child: Image.asset("img/google_logo.webp"),
                      // //             ),
                      // //             Text("Google"),
                      // //           ],
                      // //         ),
                      // //       )),
                      // //     ),
                      // //   ],
                      // // ),
                      // // SizedBox(height: h / 80),

                      // Column(
                      //   children: [
                      //     Text(
                      //       "Création de compte",
                      //       style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 30,
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: Media.height(context) * 0.03,
                      //     ),
                      //     ImageProfil(),
                      //     SizedBox(
                      //       height: Media.height(context) * 0.03,
                      //     ),
                      //     Form(
                      //       key: _key,
                      //       child: Column(
                      //         children: [
                      //           InscriptionTf(
                      //             hintText: "Prénom",
                      //             Tcontroller: prenom,
                      //             err: "Veuillez renseigner votre prenom",
                      //           ),
                      //           InscriptionTf(
                      //             hintText: "Nom",
                      //             Tcontroller: nom,
                      //             err: "Veuillez renseigner votre nom",
                      //           ),
                      //           InscriptionTf(
                      //             hintText: "E-mail",
                      //             Tcontroller: email,
                      //             err: "Veuillez renseigner votre email",
                      //             isEmail: true,
                      //           ),
                      //           Container(
                      //             padding: EdgeInsets.only(left: 8),
                      //             margin: EdgeInsets.only(bottom: 6),
                      //             width: Media.width(context) * 0.7,
                      //             decoration: BoxDecoration(
                      //               border: Border.all(
                      //                 color: Colors.white,
                      //                 width: 1,
                      //               ),
                      //               color: Colors.transparent,
                      //               borderRadius: BorderRadius.circular(20),
                      //             ),
                      //             child: InternationalPhoneNumberInput(
                      //               onInputChanged: (value) {
                      //                 telephone = value;
                      //               },

                      //               textStyle: TextStyle(
                      //                 color: Colors.white,
                      //               ),
                      //               // initialValue: ,
                      //               inputBorder: InputBorder.none,
                      //               cursorColor: Colors.white,
                      //               formatInput: false,
                      //               selectorConfig: SelectorConfig(
                      //                 selectorType:
                      //               PhoneInputSelectorType.BOTTOM_SHEET,
                      //               ),
                      //               inputDecoration: InputDecoration(
                      //                 border: InputBorder.none,
                      //                 hintText: "Téléphone",
                      //                 hintStyle: TextStyle(
                      //                   color: Colors.white,
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //           InscriptionTf(
                      //             hintText: "Mot de passe",
                      //             Tcontroller: passw,
                      //             err: "Veuillez renseigner un mot de passe",
                      //             isPassW: true,
                      //           ),
                      //           InscriptionTf(
                      //             hintText: "Confirmation mot de passe",
                      //             Tcontroller: conPassW,
                      //             err: "Confirme le mot de passe",
                      //             isPassW: true,
                      //           ),
                      //           Padding(
                      //             padding: const EdgeInsets.all(12.0),
                      //             child: ButtonCusm(
                      //                 text: 'Inscription',
                      //                 onPressed: () {
                      //
                      //                 }),
                      //           ),
                      //         ],
                      //       ),
                      //     )
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Avez-vous déjà un compte ?  "),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginVue(),
                      ));
                },
                child: Text(
                  "Connectez-vous",
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

  Widget ImageProfil() {
    return Container(
      child: Stack(children: [
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: Media.width(context) * 0.1,
          backgroundImage: _imageFile == null
              ? AssetImage("img/profil2.png")
              : FileImage(File(_imageFile!.path)) as ImageProvider,
        ),
        Positioned(
          bottom: 1.0,
          right: 1.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context, builder: (builder) => bottomSheet(context));
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        )
      ]),
    );
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 100,
      width: Media.width(context),
      margin: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: Column(
        children: [
          Text("Photo de Profil", style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                icon: Icon(
                  Icons.camera,
                  color: AppData.BasicColor,
                ),
                onPressed: () {
                  setState(() {
                    takePhoto(ImageSource.camera);
                  });
                  Navigator.pop(context);
                },
                label: Text(
                  "Caméra",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
              TextButton.icon(
                icon: Icon(
                  Icons.image,
                  color: AppData.BasicColor,
                ),
                onPressed: () {
                  setState(() {
                    takePhoto(ImageSource.gallery);
                  });
                  Navigator.pop(context);
                },
                label: Text(
                  "Galerie",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
