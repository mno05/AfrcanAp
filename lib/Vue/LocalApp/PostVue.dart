import 'dart:developer';
import 'dart:io';

import 'package:african_ap/Controllers/PostController.dart';
import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Models/Post.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Models/User.dart';
import 'package:african_ap/Vue/Widgets/BoutonCusm.dart';
import 'package:african_ap/Vue/Widgets/PostContainer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

class PostVue extends StatefulWidget {
  final SuperUser superUser;
  const PostVue({super.key, required this.superUser});

  @override
  State<PostVue> createState() => _PostVueState();
}

class _PostVueState extends State<PostVue> {
  bool PhotoIsSelectionned = false;
  bool VideoIsSelectionned = false;

  File img = File("");
  String imgName = "nul";
  XFile? imageFile;
  TextEditingController Legende = TextEditingController();
  String Portee = "Tout le monde";

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: AppData.BasicColor,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black87,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Créer un post",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 1,
              width: w,
              color: Colors.black12,
            ),
            Container(
              padding: EdgeInsets.all(8),
              width: w,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            NetworkImage(widget.superUser.imagePath),
                      ),
                      title: Text(
                        "${widget.superUser.prenom} ${widget.superUser.nom}",
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      dense: true,
                      // minLeadingWidth: 0,
                      subtitle: Container(
                        // padding: EdgeInsets.only(right: 30),
                        // color: Colors.red,
                        height: 50,
                        width: 50,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 5,
                              child: Container(
                                // width: 150,
                                height: 40,
                                decoration: BoxDecoration(
                                  // color: Colors.amber,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    width: .4,
                                    color: Colors.black,
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () => showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) => Container(
                                      height: 300,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(50),
                                            topRight: Radius.circular(50)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              right: w / 3,
                                              top: 0,
                                              left: w / 3,
                                              child: Container(
                                                width: 100,
                                                height: 5,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(height: 15),
                                                  Text(
                                                    "Qui peut voir ce post?",
                                                    style: GoogleFonts.nunito(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);

                                                      setState(() {
                                                        Portee =
                                                            "Tout le monde";
                                                      });
                                                    },
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Tout le monde",
                                                          style: GoogleFonts
                                                              .nunito(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 17,
                                                            color: AppData
                                                                .BasicColor,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Le poste sera visible pour tous les membres et non membres de la plateforme ",
                                                          style: GoogleFonts
                                                              .nunito(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14,
                                                            color:
                                                                Colors.black,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      setState(() {
                                                        Portee = widget
                                                            .superUser.type;
                                                      });
                                                    },
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Le membre ${widget.superUser.type} seulement",
                                                          style: GoogleFonts
                                                              .nunito(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 17,
                                                            color: AppData
                                                                .BasicColor,
                                                          ),
                                                        ),
                                                        Text(
                                                            "Le poste sera visible pour tous les membres ${widget.superUser.type}s seulement les autres ne veront pas celà",
                                                            style: GoogleFonts
                                                                .nunito(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 14,
                                                              color: Colors
                                                                  .black,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Portee == "Tout le monde"
                                              ? Icon(
                                                  FontAwesomeIcons.earthAfrica,
                                                  size: 15,
                                                  color: Colors.black87)
                                              : Icon(
                                                  FontAwesomeIcons.peopleGroup,
                                                  size: 15,
                                                  color: Colors.black87),
                                          SizedBox(width: 5),
                                          Text(
                                            Portee,
                                            style: GoogleFonts.nunito(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Icon(Icons.arrow_drop_down,
                                              color: Colors.black)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: h * 0.01),
                    Container(
                      padding: EdgeInsets.all(8),
                      width: w,
                      height: h / 4,
                      decoration: BoxDecoration(
                        // color: Colors.black54,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.multiline,
                        controller: Legende,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: "Que voulez-vous poster?",
                          hintStyle: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: h * 0.01),
                    VideoIsSelectionned
                        ? Container()
                        : PhotoIsSelectionned
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: h * 0.16,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.black87,
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image:
                                              FileImage(File(imageFile!.path))
                                                  as ImageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          PhotoIsSelectionned = false;
                                          imgName = "nul";
                                          img = File("");
                                        });
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      ))
                                ],
                              )
                            : ListTile(
                                leading: Icon(
                                  Icons.photo,
                                  size: 30,
                                  color: Colors.black87,
                                ),
                                title: Text(
                                  "Photo",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: () async {
                                  ImagePicker imagePicker = ImagePicker();
                                  final pickedfile = await imagePicker
                                      .pickImage(source: ImageSource.gallery);
                                  imageFile = pickedfile;
                                  img = File(imageFile!.path);
                                  imgName = imageFile!.path.split("/").last;
                                  setState(() {
                                    PhotoIsSelectionned = true;
                                  });
                                },
                              ),
                    SizedBox(height: h * 0.01),
                    PhotoIsSelectionned
                        ? Container()
                        : VideoIsSelectionned
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(imgName),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          VideoIsSelectionned = false;
                                          imgName = "nul";
                                          img = File("");
                                        });
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      ))
                                ],
                              )
                            : ListTile(
                                leading: Icon(
                                  Icons.video_camera_back,
                                  size: 30,
                                  color: Colors.black87,
                                ),
                                title: Text(
                                  "Vidéo",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: () async {
                                  ImagePicker imagePicker = ImagePicker();
                                  final pickedfile = await imagePicker
                                      .pickVideo(source: ImageSource.gallery);
                                  imageFile = pickedfile;
                                  img = File(imageFile!.path);
                                  imgName = imageFile!.path.split("/").last;
                                  setState(() {
                                    VideoIsSelectionned = true;
                                  });
                                },
                              ),
                    SizedBox(height: h * 0.07),
                    ElevatedButton(
                        child: Text("Publier"),
                        style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppData.BasicColor)),
                        onPressed: () {
                          if (Legende.text.isNotEmpty || imgName != "nul") {
                            log((imgName).toString());
                            PostController.Publier(
                              context,
                              Post(
                                idUser: widget.superUser.idSuper!,
                                Legende: Legende.text,
                                Portee:
                                    Portee == "Tout le monde" ? "Tout" : Portee,
                                type: PhotoIsSelectionned
                                    ? "Photo"
                                    : VideoIsSelectionned
                                        ? "Video"
                                        : "Text",
                                PathContenu: imgName,
                                fileData: img,
                              ),
                            );
                          } else {
                            Toast.show("Vous n'avez rien entrer");
                            log("Here");
                          }
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
