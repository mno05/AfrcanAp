<?php
include("connexion.php");
$idDes=$_POST["idDes"];
$idEx=$_POST["idEx"];

try {
    if(isset($email_telephone,$passw)){
    $res = $db->prepare("SELECT * FROM Messages WHERE  idEx=? AND idDes =?)");
    $res->execute(array($idEx,$idDes));
    if($res){
         $data = array();
        //Récupérer les lignes
        while ($row = $res->fetch()) {
        $data[] = $row;
    }

    }else{
        $data[]=["Rien"];
    }
}else{
    echo("Vide");
}
} catch (\Throwable $th) {
    $suces = 0;
    $msg = "Erreur :" . $th->getMessage();
}
echo json_encode($data);
?>