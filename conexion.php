<?php
try {
  $user = "root";
  $pass = "Motherboardmod1997.";
  $dbh = new PDO('mysql:host=localhost;dbname=pfinal', $user, $pass);

} catch (PDOException $e) {
   echo "Error!: " . $e->getMessage() . "<br/>";
  
   die();
}
