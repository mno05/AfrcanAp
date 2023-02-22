<?php
include("connexion.php");
$idEx = $_POST["idEx"];
$idDes = $_POST["idDes"];



try {
    if (isset($idEx, $idDes)) {
        $req = $db->prepare("SELECT * FROM Contacter WHERE idEx=? AND idDes=?");
        $req->execute(array($idEx, $idDes));
        $exist = $req->rowCount();
        if ($exist == 0) {
        $req = $db->prepare("INSERT INTO Contacter VALUES(null,?,?)");
        $req->execute(array($idEx, $idDes));
        if ($req) {
            $suces = 1;
            $msg = "Succes";
        } else {
            $suces = 0;
            $msg = "Echec d'enregistrement";
        }
    }else{
        $suces = 1;
        $msg = "Succes";
    }
    } else {
        $msg = "Message vide2";
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