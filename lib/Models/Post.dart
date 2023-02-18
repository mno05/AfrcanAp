import 'dart:io';

class Post {
  String? idPost;
  String idUser;
  String Portee;
  String? Legende;
  String? date;
  String? PathContenu;
  File? fileData;

  Post({
    this.idPost,
    required this.idUser,
    required this.Portee,
    this.Legende,
    this.date,
    this.PathContenu,
    this.fileData,
  });
}
