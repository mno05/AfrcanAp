<?php
include("connexion.php");
$idDes=$_POST["idDes"];
try {

    $res = $db->prepare("SELECT * FROM SuperUser WHERE idSuper in (SELECT idEx FROM Contacter WHERE idDes =?)");
    $res->execute(array($idDes));
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