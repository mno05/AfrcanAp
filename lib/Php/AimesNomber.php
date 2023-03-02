<?php
include("connexion.php");
$IdUser=$_POST["IdUser"];
try {

    $req = $db->prepare("SELECT COUNT(*) FROM Aimer WHERE IdUser=?");
    $req->execute(array($IdUser));
    $exist = $req->rowCount();
} catch (\Throwable $th) {
    $suces = 0;
    $msg = "Erreur :" . $th->getMessage();
}
echo json_encode($exist);
?>