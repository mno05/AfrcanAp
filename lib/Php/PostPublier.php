<?php
include("connexion.php");
$idUser = $_POST["idUser"];
$Portee = $_POST["Portee"];
$Legende = $_POST["Legende"];
$PathContenu = $_POST["PathContenu"];
$fileData = $_POST["fileData"];
try {

    if (isset($idUser, $Portee, $Legende, $PathContenu)) {
        if (!isset($fileData)) {
            $PathContenu = "";
            $req = $db->prepare("INSERT INTO Post VALUES(null,?,?,?,?,Now())");
            $req->execute(array($idUser, $Portee, $Legende, $PathContenu));
            if ($req) {
                $suces = 1;
                $msg = "Succes Sans file";
            } else {
                $suces = 0;
                $msg = "Echec d'enregistrement";
            }
        } else {
            $destination_dir = "img/";
            $base_filename = basename($_FILES["fileData"]["name"]);
            $temp = explode(".", $base_filename);
            $target_file = $destination_dir . round(microtime(true)) . '.' . end($temp);
            $PathContenu = "https://africanap.000webhostapp.com/african_ap/" . $target_file;
            if (move_uploaded_file($_FILES["fileData"]["tmp_name"], $target_file)) {
                $req = $db->prepare("INSERT INTO Post VALUES(null,?,?,?,?,Now())");
                $req->execute(array($idUser, $Portee, $Legende, $PathContenu));

                if ($req) {
                    $suces = 1;
                    $msg = "Succes Avec file";
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