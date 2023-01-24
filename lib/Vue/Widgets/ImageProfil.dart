import 'dart:io';

import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageProfil extends StatefulWidget {
  const ImageProfil({super.key});

  @override
  State<ImageProfil> createState() => _ImageProfilState();
}

class _ImageProfilState extends State<ImageProfil> {
  PickedFile? _imageFile;
  ImagePicker _imagePicker = ImagePicker();
  void takePhoto(ImageSource source) async {
    final pickedfile = await _imagePicker.getImage(source: source);
    setState(() {
      _imageFile = pickedfile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        CircleAvatar(
          radius: 80.0,
          backgroundImage: _imageFile == null
              ? AssetImage("img/profil.png")
              : FileImage(File(_imageFile!.path)) as ImageProvider,
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
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
                icon: Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                  Navigator.pop(context);

                },
                label: Text("Caméra"),
              ),
              TextButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                  Navigator.pop(context);
                },
                label: Text("Galerie"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
