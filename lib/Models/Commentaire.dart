class Commentaire{
  String? idCommentaire;
  String idUser;
  String idPost;
  String contenu;
  String date;
  Commentaire({
    this.idCommentaire,
    required this.idUser,
    required this.idPost,
    required this.contenu,
    required this.date,
  });
}