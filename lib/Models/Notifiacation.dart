class NotificationM{
  String? idNotif;
  String idUser;
  String idPost;
  String portee;
  String contenue;
  String? imagePath;

  DateTime? date;

  
  NotificationM({
    this.idNotif,
    required this.idUser,
    required this.date,
    required this.contenue,
    required this.idPost,
    required this.portee,
    required this.imagePath,
  });


 Map<String, String> ToMap(){
    return {
      "idNotif":idNotif.toString(),
      "IdUser":idUser,
      "IdPost":idPost,
      "portee":portee,
      "contenue":contenue,
      "date":date.toString(),

    };
  }
}