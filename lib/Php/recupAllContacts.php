<?php
include("connexion.php");

try {

    $res = $conn->query("SELECT * FROM SuperUser");
    //Initialiser un tableau
    $data = array();
    //Récupérer les lignes
    while ($row = $res->fetch_assoc()) {
        $data[] = $row;
    }
    //Afficher le tableau au format JSON
} catch (\Throwable $th) {
    $suces = 0;
    $msg = "Erreur :" . $th->getMessage();
}
echo json_encode($data);
?>