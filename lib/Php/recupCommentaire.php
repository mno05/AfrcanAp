<?php
include("connexion.php");
$idPost = $_POST["idPost"];
try {

    $res = $db->query("SELECT * FROM Commentaire Where idPost=$idPost");
    //Initialiser un tableau
    $data = array();
    //Récupérer les lignes
    while ($row = $res->fetch()) {
        $data[] = $row;
    }
    //Afficher le tableau au format JSON
} catch (\Throwable $th) {
    $suces = 0;
    $msg = "Erreur :" . $th->getMessage();
}
echo json_encode($data);
?>