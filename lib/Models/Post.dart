import 'dart:io';

class Post {
  String? idPost;
  String idUser;
  String Portee;
  String? Legende;
  String? date;
  String? PathContenu;
  String type;
  File? fileData;

  Post({
    this.idPost,
    required this.idUser,
    required this.Portee,
    this.Legende,
    this.date,
    required this.type,
    this.PathContenu,
    this.fileData,
  });
}
