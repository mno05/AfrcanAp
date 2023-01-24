<?php
include("Connexion.php");
$prenom = $_POST["prenom"];
$nom = $_POST["nom"];
$telephone = $_POST["telephone"];
$email = $_POST["email"];
$passw = sha1($_POST["passw"]);
$image = $_POST["image"];

try {
    if(isset($prenom,$nom,$telephone,$email,$pass,$image)){
        $req = $db->prepare("SELECT * FROM user WHERE email=? OR telephone=?");
        $req->execute(array($email,$telephone));
        $exist = $req->rowCount();
        if($exist==0){
            $req = $db->prepare("INSERT INTO user VALUES(null,?,?,?,?,?,?)");
            $req->execute(array($prenom, $nom, $telephone, $email, $passw, $image));
            if($req){
                $suces = 1;
            }else{
                $suces = 0;
                $msg = "Echec enregistrement";
            }

        }else{
            $msg = "Email ou le numero de telephone existe deja";
            $suces = 0;
        }

    }else{
        $suces = 0;
        $msg = "Pas de données envoyées";
    }
}catch (\Throwable $th) {
    $suces = 0;
    $msg = "Erreur :" . $th->getMessage();
}
echo json_encode([
    "data"=>[
        $msg,
        $suces,       
    ]
])


// echo json_encode([
//     "result"=>[
//         $prenom,
//         $nom,
//         $telephone,
//         $email,
//         $passw,
//         $image
//     ]
// ]);
?>
