<?php
$host = "vps83035.serveur-vps.net";
$dbname = "myapbe";
$user = "admin_myap";
$pass = "PibWgC4!EbcR";

try {
    $db = new PDO("mysql:host=$host; dbname=$dbname", $user, $pass);
    // echo json_encode([
    //     "Connexion reussie"
    // ]);
} catch (\Throwable $th) {
    echo ("Erreur de connexion:" . $th->getMessage());
}
?>
