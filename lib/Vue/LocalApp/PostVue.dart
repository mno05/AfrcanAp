import 'dart:developer';
import 'dart:io';

import 'package:african_ap/Controllers/PostController.dart';
import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Models/Post.dart';
import 'package:african_ap/Models/User.dart';
import 'package:african_ap/Vue/Widgets/BoutonCusm.dart';
import 'package:african_ap/Vue/Widgets/PostContainer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

class PostVue extends StatefulWidget {
  final User user;
  const PostVue({super.key, required this.user});

  @override
  State<PostVue> createState() => _PostVueState();
}

class _PostVueState extends State<PostVue> {
  String hintPortee = "Choisissez la portée du post";
  bool PhotoIsSelectionned = false;
  bool VideoIsSelectionned = false;
  File img = File("");
  String imgName = "Nul";
  XFile? imageFile;
  TextEditingController Legende = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppData.BasicColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Créer un post"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 1,
              width: w,
              color: Colors.white38,
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
                        backgroundImage: NetworkImage(widget.user.imageName),
                      ),
                      title: Text(
                        "${widget.user.prenom} ${widget.user.nom}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      dense: true,
                      minLeadingWidth: 4,
                      subtitle: Container(
                        padding: EdgeInsets.only(right: 30),
                        // color: Colors.red,
                        height: 50,
                        width: 50,
                        child: DropdownButton(
                          isDense: true,
                          isExpanded: true,
                          hint: Text(hintPortee),
                          items: [
                            DropdownMenuItem(
                                child: Text("Grand public"),
                                value: "Grand public"),
                            DropdownMenuItem(
                                child: Text("Membre Adhérent uniquement"),
                                value: "Membre Adhérent uniquement"),
                            DropdownMenuItem(
                                child: Text("Membre effectif uniquement"),
                                value: "Membre effectif uniquement"),
                            DropdownMenuItem(
                                child: Text("Membre d'honneur uniquement"),
                                value: "Membre d'honneur uniquement"),
                          ],
                          onChanged: (value) {
                            setState(() {
                              hintPortee = value.toString();
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: h * 0.01),
                    Container(
                      padding: EdgeInsets.all(8),
                      width: w,
                      height: h / 5,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.multiline,
                        controller: Legende,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: "Que voulez-vous poster?",
                          hintStyle: TextStyle(
                            color: Colors.white70,
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
                                      color: Colors.black,
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
                                  color: Colors.white70,
                                ),
                                title: Text(
                                  "Photo",
                                  style: TextStyle(
                                    color: Colors.white70,
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
                                  color: Colors.white70,
                                ),
                                title: Text(
                                  "Vidéo",
                                  style: TextStyle(
                                    color: Colors.white70,
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
                    ButtonCusm(
                      text: "Publier",
                      onPressed: () {
                        if (hintPortee == "Choisissez la portée du post") {
                          Toast.show("Veuillez séléctionner la portée du post");
                        } else {
                          if (Legende.text.isEmpty || imgName.isEmpty) {
                            Toast.show("Vous n'avez rien entrer");
                          } else {
                            log(imgName);
                            PostController.Publier(
                                context,
                                Post(
                                    idUser: widget.user.Id,
                                    Legende: Legende.text,
                                    Portee: hintPortee,
                                    PathContenu: imgName,
                                    fileData: img));
                          }
                        }
                      },
                    )
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
