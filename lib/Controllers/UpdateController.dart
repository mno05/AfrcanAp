// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:african_ap/Controllers/LoginController.dart';
// import 'package:african_ap/Controllers/SuperUserController.dart';
// import 'package:african_ap/Models/SuperUser.dart';
// import 'package:african_ap/Models/User.dart';
// import 'package:african_ap/Vue/LocalApp/Principal.dart';
// import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart';
// import 'package:toast/toast.dart';

// class UpdateController{
//   static UpdateSuperUser({
//     required BuildContext context,
//     required SuperUser superUser,
//     required File imageData,
//     required String imageName,
//   }) async{
//     BasicsWidgets.Load(context);
//     try {
//       String fileName = basename(imageData.path);
//       String path = imageData.path;
//       FormData formData;
//       // String Url = "https://myap.moglich.net/api/inscription.php/";
//       String url =
//           "https://myap.moglich.net/api/updateSuperUser.php/";
//       if (imageName == "") {
//         formData = FormData.fromMap({
//           "prenom": superUser.prenom,
//           "nom": superUser.nom,
//           "paysOrgine": superUser.paysOrgine,
//           "adresse": superUser.adresse,
//           "codePostal": superUser.codePostal,
//           "localite": superUser.localite,
//           "pays": superUser.pays,
//           "statutpro": superUser.statutpro,
//           "fonction": superUser.fonction,
//           "domainesExpertise": superUser.domainesExpertise,
//           "adresseMail": superUser.adresseMail,
//           "imagePath": "",
//         });
//       } else {
//         formData = FormData.fromMap({
//           "prenom": superUser.prenom,
//           "nom": superUser.nom,
//           "paysOrgine": superUser.paysOrgine,
//           "adresse": superUser.adresse,
//           "codePostal": superUser.codePostal,
//           "localite": superUser.localite,
//           "pays": superUser.pays,
//           "statutpro": superUser.statutpro,
//           "fonction": superUser.fonction,
//           "domainesExpertise": superUser.domainesExpertise,
//           "adresseMail": superUser.adresseMail,
//           "imagePath": imageName,
//           "imageData": await MultipartFile.fromFile(path, filename: fileName),
//         });
//       }
//       final Response = await Dio().post(url, data: formData);
//       if (Response.statusCode == 200) {
//         String rs = Response.data.toString().replaceAll("\n", "");
//         var data = jsonDecode(rs);
//         var resultat = data["data"];
//         int succes = resultat[1];
//         if (succes == 1) {
//           Navigator.pop(context);
//           Toast.show("Kitoool");
//           SuperUserController.SuperUserLoginWithoutPw(context, email: superUser.adresseMail);
//         } else {
//           Navigator.pop(context);
//           Toast.show(resultat[0], duration: 8);
//         }
//         print(succes);
//       }
//     } catch (e) {
//       Navigator.pop(context);
//       log(e.toString());
//     }
//   }
// }