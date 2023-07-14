<?php
include("connexion.php");
$prenom = $_POST["prenom"];
$nom = $_POST["nom"];
$paysOrgine = $_POST["paysOrgine"];
$adresse = $_POST["adresse"];
$codePostal = $_POST["codePostal"];
$localite = $_POST["localite"];
$pays = $_POST["pays"];
$statutpro = $_POST["statutpro"];
$autreStatut = $_POST["autreStatut"];
$fonction = $_POST["fonction"];
$domainesExpertise = $_POST["domainesExpertise"];
$type = $_POST["type"];
$telephone = $_POST["telephone"];
$email = $_POST["adresseMail"];
$passw = $_POST["mtp"];
$imageName = $_POST["imagePath"];

try {
    if (isset($prenom, $nom,$paysOrgine, $telephone,$pays,$statutpro,$fonction,$domainesExpertise, $email, $passw)) {
        $req = $db->prepare("SELECT * FROM SuperUser WHERE adresseMail=? OR telephone=?");
        $req->execute(array($email, $telephone));
        $exist = $req->rowCount();
        if ($exist == 0) {
            $req = $db->prepare("INSERT INTO SuperUser VALUES(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            $req->execute(array($prenom, $nom,$paysOrgine,$adresse,$codePostal,$localite,$pays,$telephone, $email,$statutpro,$autreStatut,$fonction,$domainesExpertise,$imageName,$type,$passw));
            if ($req) {
                $suces = 1;
                $msg = "Succes";
            } else {
                $suces = 0;
                $msg = "Echec d'enregistrement";
            }
        } else {
            $suces = 0;
            $msg = "L'email ou le numero de telephone existe deja";
        }
    } else {
        $suces = 0;
        $msg = "Pas de données envoyées";
    }
} catch (\Throwable $th) {
    $suces = 0;
    $msg = "Erreur :" . $th->getMessage();
}
echo json_encode([
    "data" => [
        $msg,
        $suces,
    ]
])
    ?>