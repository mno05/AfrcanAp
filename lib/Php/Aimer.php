<?php
include("connexion.php");
$idPost = $_POST["idPost"];
$IdUser = $_POST["IdUser"];

try {
    if (isset($idPost, $IdUser)) {
        $req = $db->prepare("SELECT * FROM Aimer WHERE IdUser=?");
        $req->execute(array($IdUser));
        $exist = $req->rowCount();
        if ($exist == 1) {
            $req = $db->prepare("INSERT INTO Aimer VALUES(null,?,?)");
            $req->execute(array($idPost, $IdUser));
            $msg = "Login effetue";
            $suces = 1;

        } else {
            $msg = "Aime";
            $suces = 0;
        }

    } else {
        $suces = 0;
        $msg = "Pas de donnees envoyees";
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