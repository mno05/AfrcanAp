import 'dart:io';

class UserM {
  UserM({
    required this.prenom,
    required this.nom,
    required this.telephone,
    required this.email,
    required this.passw,
    required this.imageName,
    required this.imageData,
    this.Id="",
    this.isLambda=true,

  });
  late final String prenom;
  late final String nom;
  late final String telephone;
  late final String email;
  late final String passw;

  late final String imageName;
  late final File imageData;
  String Id;
  bool isLambda;


  
  // User.fromJson(Map<String, dynamic> json){
  //   prenom = json['prenom'];
  //   nom = json['nom'];
  //   telephone = json['telephone'];
  //   email = json['email'];
  //   passw = json['passw'];
  //   imageName = json['image'];
  //   imageData = json['image'];

  // }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['prenom'] = prenom;
    _data['nom'] = nom;
    _data['telephone'] = telephone;
    _data['email'] = email;
    _data['passw'] = passw;
    _data['image'] = imageName;
    _data['image'] = imageData;

    return _data;
  }
}