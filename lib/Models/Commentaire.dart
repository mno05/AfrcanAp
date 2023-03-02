class Commentaire{
  String? idCommentaire;
  String idUser;
  String idPost;
  String contenu;
  String imagePath;
  String prenom;
  String nom;
  DateTime date;
  Commentaire({
    this.idCommentaire,
    required this.idUser,
    required this.idPost,
    required this.contenu,
    required this.imagePath,
    required this.prenom,
    required this.nom,
    required this.date,
  });

  @override
  toString(){
    return "idCommentaire:${idCommentaire},idUser:${idUser},idPost:${idPost},contenu:${contenu},date:${date}";
  }
}