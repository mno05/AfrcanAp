<?php
$host = "localhost";
$dbname = "african_ap";
$user = "root";
$pass = "";
try {
    $db = new PDO("mysql:host=$host; dbname=$dbname", $user, $pass);
    echo ("Connected");
} catch (\Throwable $th) {
    echo ("Erreur de connexion:" . $th->getMessage());
}
?>