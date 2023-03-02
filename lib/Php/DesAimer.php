<?php
include("connexion.php");
$IdUser = $_POST["IdUser"];

try {
    if (isset($idPost, $IdUser)) {
        $req = $db->prepare("DELETE FROM Aimer WHERE IdUser = ?");
        $req->execute(array($IdUser));
        $msg = "Fait";
        $suces = 1;
    } else {
        $msg = "DesAime";
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