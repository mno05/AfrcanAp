<?php
include("connexion.php");
$idDes=$_POST["idDes"];
$idEx=$_POST["idEx"];

try {

    $res = $db->query("SELECT * FROM Messages WHERE (idEx=$idEx AND idDes=$idDes) or (idEx=$idDes AND idDes=$idEx) Limit 0,1");
//    $res->execute(array($idEx,$idDes));
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