<?php
include("connexion.php");
$idEx = $_POST["idEx"];
$idDes = $_POST["idDes"];
$text = $_POST["text"];
$date = $_POST["date"];


try {
    if (isset($idMessage, $idEx, $idDes, $date)) {
        $req = $db->prepare("INSERT INTO Messages VALUES(null,?,?,?,Now())");
        $req->execute(array($idEx, $idDes, $text));

        if ($req) {
            $suces = 1;
            $msg = "Succes";
        } else {
            $suces = 0;
            $msg = "Echec d'enregistrement";
        }

    } else {
        $msg = "Message vide";
        $suces = 0;
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