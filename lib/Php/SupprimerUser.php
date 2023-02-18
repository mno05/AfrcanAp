<?php
include("connexion.php");
$email = $_POST["email"];
try {
    if (isset($email)) {
        $req = $db->prepare("SELECT * FROM user WHERE email=?");
        $req->execute(array($email ));
        $exist = $req->rowCount();
        if ($exist == 1) {
            $req2 = $db->prepare("DELETE FROM user WHERE email=?");
            $req2->execute(array( $email));
            if ($req2) {
                $msg = "Login effetue";
                $suces = 1;
            } else {
                $msg = "Echec de suppression";
                $suces = 0;
            }

        } else {
            $msg = "Email/telephone ou mot de passe inconrrect";
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