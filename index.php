<?php
  require_once('./conexion.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
  <title>Proyecto final</title>

</head>
<body>
  
  <div class="container">
    <h1>
      Ordenes realizadas
    </h1>

    <table class="table table-striped">
    
      <thead>
        
        <th>ID Orden</th>
        <th>Apellido</th>
        <th>Nombre</th>
        <th>Nombre del producto</th>
        <th>Precio Total</th>
        <th>Fecha</th>
        <th>Tipo de Pago</th>
        <th>Acciones</th>

      </thead>

      <tbody>
      
        <?php
          $statement = $dbh->prepare("SELECT * FROM pfinal.pedidos_clientes;");
          if(!$statement){
            die("Ocurrió un error");
          } else {
            $state = $statement->execute();
            if(!$state){
              die("Ocurrió un error");
            } else {
              $result = $statement->fetchAll(PDO::FETCH_ASSOC);

              foreach ($result as $values) {
                echo "<tr>";
                  foreach ($values as $key => $data) {
                    echo "<td>".$data."</td>";
                  }

                echo "<td><a href='./editar.php?id=".$values['ID_Orden']."'>Editar</a>&nbsp;<a href='./eliminar.php?id=".$values['ID_Orden']."'>Eliminar</a></td>";
                echo "</tr>";
              }

            }
          }
          $statement->closeCursor();
        ?>

      </tbody>

    </table>

    <hr />

    <h1>Agregar Pedido</h1>

    <form action="./agregar.php" method="POST">
      <label class="form-label" for="select-user"> Selecciona el usuario que hizo el pedido </label>
      <select name="select-user" id="select-user" class="form-select" aria-label="Default select example">
        <?php 
          $statement = $dbh->prepare("SELECT `ID_Cliente`, `Nombre`,`Apellido` FROM pfinal.cliente;");
          if(!$statement){
            die("Ocurrió un error");
          } else {
            $state = $statement->execute();
            if(!$state){
              die("Ocurrió un error");
            } else {
              $result = $statement->fetchAll(PDO::FETCH_ASSOC);

              foreach ($result as $values) {
                echo "<option value='".$values['ID_Cliente']."'>".$values['Apellido']." ".$values['Nombre']."</option>";
              }

            }
          }
          $statement->closeCursor();
        ?>
      </select>

      <br />

      <label class="form-label" for="select-product"> Selecciona el producto que el usuario adquirió </label>
      <select name="select-product" id="select-product" class="form-select" aria-label="Default select example">
        <?php 
          $statement = $dbh->prepare("SELECT `ID_Producto`, `Nombre_Producto` FROM pfinal.producto;");
          if(!$statement){
            die("Ocurrió un error");
          } else {
            $state = $statement->execute();
            if(!$state){
              die("Ocurrió un error");
            } else {
              $result = $statement->fetchAll(PDO::FETCH_ASSOC);

              foreach ($result as $values) {
                echo "<option value='".$values['ID_Producto']."'>".$values['Nombre_Producto']."</option>";
              }

            }
          }
        ?>
      </select>

      <br />

      <label class="form-label" for="cantidad"> Ingrese la cantidad </label>
      <input class="form-control" type="number" name="cantidad" id="cantidad">

      <br />

      <label class="form-label" for="fecha"> Ingrese la fecha </label>
      <input class="form-control" type="date" name="fecha" id="cantidad">

      <br />

      <label for="tipo-pago" class="form-label"> Ingresa tipo de pago </label>
      <select class="form-select" name="tipo-pago" id="tipo-pago">
          <option value="Efectivo">Efectivo</option>
          <option value="Tarjeta">Tarjeta</option>
      </select>

      <br />

      <input class="btn btn-primary" type="submit" value="Guardar">

    </form>

  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>