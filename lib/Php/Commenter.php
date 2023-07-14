<?php
include("connexion.php");
$idPost = $_POST["idPost"];
$idUser = $_POST["idUser"];
$contenu = $_POST["contenu"];
try {
    if (isset($idPost, $idUser, $contenu)) {
        $req = $db->prepare("INSERT INTO Commentaire VALUES(null,?,?,?,Now())");
        $req->execute(array($idPost, $idUser, $contenu));
        if ($req) {
            $suces = 1;
            $msg = "Succes";
        } else {
            $suces = 0;
            $msg = "Echec d'enregistrement";
        }
    } else {
        $msg = "Commentaire vide";
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