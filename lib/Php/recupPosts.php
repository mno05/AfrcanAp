<?php
include("connexion.php");
$mbr=$_POST["mbr"];

try {

    $res = $db->query("SELECT P.Lengende,P.PathContenu,P.type,P.date,S.prenom,S.nom,S.imagePath FROM Post P INNER JOIN SuperUser S ON P.idUser=S.idSuper");
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