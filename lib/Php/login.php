<?php
include("Connexion.php");
$email_telephone = $_POST["email_telephone"];
$passw = sha1($_POST["passw"]);
try {
    if(isset($email,$pass)){
        $req = $db->prepare("SELECT * FROM user WHERE email=? OR telephone=? AND passW=?");
        $req->execute(array($email,$telephone,$pass));
        $exist = $req->rowCount();
        if($exist==1){
            $array = $req->fetch();
            $msg = "Login effetue";
            $suces = 1;

        }else{
            $msg = "Email/telephone ou mot de passe inconrrect";
            $suces = 0;
        }

    }else{
        $suces = 0;
        $msg = "Pas de donnees envoyees";
    }
}catch (\Throwable $th) {
    $suces = 0;
    $msg = "Erreur :" . $th->getMessage();
}
echo json_encode([
    "data"=>[
        $msg,
        $suces,
        $array,     
    ]
])
?>
