class SuperUser {
  String? idSuper;
  String prenom;
  String nom;
  String paysOrgine;
  String adresse;
  String codePostal;
  String localite;
  String pays;
  String telephone;
  String adresseMail;
  String statutpro;
  String autreStatut;
  String domainesExpertise;
  String imagePath;
  String fonction;
  String type;
  String? mtp;
  String? dateAdhesion;

  SuperUser({
    this.idSuper,
    required this.prenom,
    required this.nom,
    required this.paysOrgine,
    required this.adresse,
    required this.codePostal,
    required this.localite,
    required this.pays,
    required this.telephone,
    required this.adresseMail,
    required this.type,
    required this.statutpro,
    required this.autreStatut,
    required this.fonction,
    required this.domainesExpertise,
    required this.imagePath,
    this.mtp,
    this.dateAdhesion
  });

  Map<String, String> ToMap() {
    return {
      "prenom": this.prenom,
      "nom": this.nom,
      "paysOrgine": this.paysOrgine,
      "adresse": this.adresse,
      "codePostal": this.codePostal,
      "localite": this.localite,
      "pays": this.pays,
      "telephone": this.telephone,
      "adresseMail": this.adresseMail,
      "statutpro": this.statutpro,
      "autreStatut": this.autreStatut,
      "fonction": this.fonction,
      "domainesExpertise": this.domainesExpertise,
      "imagePath": this.imagePath,
      "type": this.type,
      "mtp": this.mtp!,
      "dateAdhesion": this.dateAdhesion!
    };
  }

  @override
  toString() {
    return "prenom: ${this.prenom},nom: ${this.nom},paysOrgine: ${this.paysOrgine},adresse: ${this.adresse},codePostal: ${this.codePostal},localite: ${this.localite},pays: this.pays,telephone: this.telephone,adresseMail: this.adresseMail,statutpro: this.statutpro,autreStatut: this.autreStatut,fonction: this.fonction,domainesExpertise: this.domainesExpertise,imagePath: this.imagePath,type: this.type,mtp: this.mtp!";
  }
}
