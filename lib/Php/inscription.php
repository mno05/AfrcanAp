<?php
include("connexion.php");
$prenom = $_POST["prenom"];
$nom = $_POST["nom"];
$telephone = $_POST["telephone"];
$email = $_POST["email"];
$passw = sha1($_POST["passw"]);
$imageName = $_POST["imageName"];


try {
    if (isset($prenom, $nom, $telephone, $email, $passw)) {
        $req = $db->prepare("SELECT * FROM user WHERE email=? OR telephone=?");
        $req->execute(array($email, $telephone));
        $exist = $req->rowCount();
        if ($exist == 0) {
            if (!isset($imageName)) {
                $path = "https://africanap.000webhostapp.com/african_ap/img/profil.png";
                $req = $db->prepare("INSERT INTO user VALUES(null,?,?,?,?,?,?)");
                $req->execute(array($prenom, $nom, $telephone, $email, $passw, $path));
                if ($req) {
                    $suces = 1;
                    $msg = "Succes";
                } else {
                    $suces = 0;
                    $msg = "Echec d'enregistrement";
                }
            } else {
                $destination_dir = "img/";
                $base_filename = basename($_FILES["imageData"]["name"]);
                $temp = explode(".", $base_filename);
                $target_file = $destination_dir . round(microtime(true)) . '.' . end($temp);
                //$path = $_SERVER['DOCUMENT_ROOT'] . '/sites/bestinfo/images/news/CodeCogsEqn.gif';
                $path = "https://africanap.000webhostapp.com/african_ap/" . $target_file;
                if (move_uploaded_file($_FILES["imageData"]["tmp_name"], $target_file)) {
                    $req = $db->prepare("INSERT INTO user VALUES(null,?,?,?,?,?,?)");
                    $req->execute(array($prenom, $nom, $telephone, $email, $passw, $path));

                    if ($req) {
                        $suces = 1;
                        $msg = "Succes";
                    } else {
                        $suces = 0;
                        $msg = "Echec d'enregistrement";
                    }

                } else {
                    $msg = "Probleme de photo de profile";
                    $suces = 0;
                }
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