<?php
try {
  $user = "#";
  $pass = "#";
  $dbh = new PDO('mysql:host=localhost;dbname=pfinal', $user, $pass);

} catch (PDOException $e) {
   echo "Error!: " . $e->getMessage() . "<br/>";
  
   die();
}
