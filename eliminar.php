<?php
require_once('./conexion.php');

if(isset($_POST['id'])){
  // Eliminamos

  $SQL = "DELETE FROM ordena WHERE ID_Orden = ?";
  $statement = $dbh->prepare($SQL);

  if(!$statement) {
    die("Ocurrió un error");
  } else {
    $result = $statement->execute(array($_POST['id']));
  }

} else if(!isset($_GET['id'])){
  // Redirigimos si no hay ID
  header('location: /');
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Eliminar</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

</head>
<body>
  
  <div class="container">
  
    <?php if(isset($_POST['id'])): ?>

      <div class="alert alert-primary" role="alert">
        <h4 class="alert-heading">¡Atención!</h4>
        <p>Elemento eliminado correctamente</p>
        <hr>
        <p class="mb-0">
          <a href="/" role="button" class="btn btn-primary">Ok</a>
        </p>
      </div>

    <?php else :?>

    <form action="./eliminar.php" method="POST">
      <input type="hidden" name="id" value="<?php echo $_GET['id']; ?>">
      <div class="alert alert-warning" role="alert">
        <h4 class="alert-heading">¡Atención!</h4>
        <p>¿Estas seguro de continuar? La acción no se puede deshacer</p>
        <hr>
        <p class="mb-0">

          <input type="submit" value="Eliminar" class="btn btn-danger">
          <a href="/" role="button" class="btn btn-primary">Cancelar</a>
        </p>
      </div>
    </form>

    <?php endif; ?>

  </div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

</body>
</html>