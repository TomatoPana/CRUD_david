<?php
  require_once('./conexion.php');

  $result = false;

  if(isset($_POST['Precio_Total'])) {

    $Precio_Total = $_POST['Precio_Total'];
    $Fecha = $_POST['Fecha'];
    $Tipo_Pago = $_POST['Tipo_Pago'];
    $id = $_POST['id'];
    $_GET['id'] = $_POST['id'];

    $datos = array($Precio_Total, $Fecha, $Tipo_Pago, $id);

    $SQL = "UPDATE `ordena` SET `Precio_Total` = ?, `Fecha` = ?, `Tipo_Pago` = ? WHERE (`ID_Orden` = ?)";

    $statement = $dbh->prepare($SQL);

    if(!$statement) {
      die("Ocurrió un error");
    } else {
      $result = $statement->execute($datos);
    }

  } else if(!isset($_GET['id'])){
    header('location: /');
  }

?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Editar elemento</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
<body>
  <div class="container">
  <?php if(isset($_POST['Precio_Total'])): ?>
  <div class="alert alert-<?php echo ($result) ? 'success' : 'danger'?>" role="alert">
    <h4 class="alert-heading"><?php echo ($result) ? 'Datos actualizados correctamente' : 'Ocurrió un problema'?></h4>
    <p><?php 
    echo ($result) ? 
    'Los datos se guardaron en la base de datos' : 
    'No se pudo guardar la información, favor de intentarlo después'?></p>
    <hr>
    <p class="mb-0"><a href="/"> Volver a atrás</a></p>
  </div>
  <?php endif; ?>

  <h1>Editando elemento</h1>
  <form action="./editar.php" method="POST">

    <?php 
    
    $statement = $dbh->prepare("SELECT * FROM pfinal.pedidos_clientes WHERE ID_Orden = ?");
    if(!$statement){
      die("Ocurrió un error");
    } else {
      $state = $statement->execute(array($_GET['id']));
      if(!$state){
        die("Ocurrió un error");
      } else {
        $result = $statement->fetch(PDO::FETCH_ASSOC);

        ?>
          <label class="form-label" for="">ID Orden</label>
          <input class="form-control" type="text" readonly value="<?php echo $result['ID_Orden'];?>">
          <div class="form-text">El valor de este campo no se puede editar debido a que proviene de otra tabla</div>
          <br />

          <label class="form-label" for="">Apellido</label>
          <input class="form-control" type="text" readonly value="<?php echo $result['Apellido'];?>">
          <div class="form-text">El valor de este campo no se puede editar debido a que proviene de otra tabla</div>
          <br />

          <label class="form-label" for="">Nombre</label>
          <input class="form-control" type="text" readonly value="<?php echo $result['Nombre'];?>">
          <div class="form-text">El valor de este campo no se puede editar debido a que proviene de otra tabla</div>
          <br />

          <label class="form-label" for="">Nombre del Producto</label>
          <input class="form-control" type="text" readonly value="<?php echo $result['Nombre_Producto'];?>">
          <div class="form-text">El valor de este campo no se puede editar debido a que proviene de otra tabla</div>
          <br />

          <label class="form-label" for="">Precio Total</label>
          <input name="Precio Total" type="number" class="form-control" value="<?php echo $result['Precio_Total']; ?>">
          <br />

          <label class="form-label" for="">Fecha</label>
          <input name="Fecha" type="date" class="form-control" value="<?php echo $result['Fecha']; ?>">
          <br />

          <label class="form-label" for="">Tipo de Pago</label>
          <input name="Tipo_Pago" type="text" class="form-control" value="<?php echo $result['Tipo_Pago']; ?>">
          <br />

          <input name="id" type="hidden" value="<?php echo $_GET['id'];?>">

          <input class="btn btn-primary" type="submit" value="Guardar">
        <?php

      }
    }

    ?>

  </form>
  
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>