<?php
require_once("./conexion.php");

$Precio_Total = "";

$statement = $dbh->prepare("SELECT `precio` FROM producto WHERE `ID_Producto` = ?");
if(!$statement) {
  die("Ocurrió un error");
} else {
  $statement->execute(array($_POST['select-product']));
  $Precio_Total = $statement->fetch(PDO::FETCH_NUM)[0];
}

$ID_Cliente = $_POST['select-user'];
$ID_Producto = $_POST['select-product'];
$Precio_Total = $Precio_Total * $_POST['cantidad'];
$Fecha = $_POST['fecha'];
$Tipo_Pago = $_POST['tipo-pago'];

$datos = array($ID_Cliente, $ID_Producto, $Precio_Total, $Fecha, $Tipo_Pago);

$SQL = "INSERT INTO pfinal.ordena (ID_Cliente, ID_Producto, Precio_Total, Fecha, Tipo_Pago) VALUES (?,?,?,?,?)";

$statement = $dbh->prepare($SQL);

if(!$statement) {
  die("Ocurrió un problema");
} else {
  $result = $statement->execute($datos);
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Agregar Item</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

</head>
<body>
  <div class="container">
      <div class="alert alert-<?php echo ($result) ? 'success' : 'danger'?>" role="alert">
        <h4 class="alert-heading"><?php echo ($result) ? 'Datos ingresados correctamente' : 'Ocurrió un problema'?></h4>
        <p><?php 
        echo ($result) ? 
        'Los datos se guardaron en la base de datos' : 
        'No se pudo guardar la información, favor de intentarlo después'?></p>
        <hr>
        <p class="mb-0"><a href="/"> Volver a atrás</a></p>
      </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

</body>
</html>