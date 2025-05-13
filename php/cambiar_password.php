<?php
session_start();
include 'db_connection.php';

$id_usuario = $_SESSION['id_usuario'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Recibir y sanitizar los datos
    $contrasena_antigua = trim($_POST['contrasena']);
    $contrasena_nueva = $_POST['contrasena-nueva'];
    $repeat_contrasena_nueva = $_POST['repeat-contrasena-nueva'];

    // Verificar si los campos están vacíos
    if (empty($contrasena_antigua) || empty($contrasena_nueva) || empty($repeat_contrasena_nueva)) {
        die("Por favor, completa todos los campos.");
    }

    // Verificamos que las contraseñas nuevas coincidan
    if ($contrasena_nueva !== $repeat_contrasena_nueva) {
        header("Location: /php/cambiar_password.php?error=contrasena_no_coincide");
        exit();
    }

    // Traemos la contraseña actual desde la base de datos
    $sql = $conn->prepare("SELECT contrasena FROM usuarios WHERE id_usuario = ?");
    $sql->bind_param("i", $id_usuario);
    $sql->execute();
    $resultado = $sql->get_result();

    if ($resultado->num_rows === 0) {
        die("Usuario no encontrado.");
    }

    $usuario = $resultado->fetch_assoc();
    $hash_actual = $usuario['contrasena'];

    // Verificar la contraseña antigua
    if (!password_verify($contrasena_antigua, $hash_actual)) {
        header("Location: /php/cambiar_password.php?error=contrasena_incorrecta");
        exit();
    }

    // Encriptamos la nueva contraseña
    $hashed_password_nueva = password_hash($contrasena_nueva, PASSWORD_BCRYPT);

    // Actualizamos la contraseña en la base de datos
    $update = $conn->prepare("UPDATE usuarios SET contrasena = ? WHERE id_usuario = ?");
    $update->bind_param("si", $hashed_password_nueva, $id_usuario);

    if ($update->execute()) {
        // Opcional: Cerrar la sesión después de cambiar la contraseña
        session_destroy();

        // Redirigir al login o a donde prefieras
        header("Location: /php/cambiar_password.php?mensaje=contrasena_actualizada");
        exit();
    } else {
        die("Error al actualizar la contraseña: " . $update->error);
    }

    // Cerrar consultas
    $sql->close();
    $update->close();
}

// Cerrar la conexión
$conn->close();
?>


<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Lengua de Señas Española </title>
    <link rel="stylesheet" href="/css/styles.css">
    <link rel="stylesheet" href="/css/styles-cuenta.css">
</head>
<body>
    <?php include "cabecera.php"?>

    <div id="login-container">
        <p id="login-title"> <strong>Cambiar Contraseña</strong> </p>

        <form method="POST" action="/php/cambiar_password.php">
            <!-- Username -->
            <div class="form-group">
                <label> Contraseña Antigua: </label>
                <input type="text" class="form-control" name="contrasena" placeholder="Contraseña antigua" required>
            </div>
            <!-- Password -->
            <div class="form-group">
                <label> Contraseña Nueva: </label>
                <input type="password" class="form-control" name="contrasena-nueva" placeholder="Contraseña nueva" required>
            </div>
        
            <!-- Repetir Password -->
            <div class="form-group">
                <label> Repetir Contraseña: </label>
                <input type="password" class="form-control" name="repeat-contrasena-nueva" placeholder="Repetir contraseña" required>
            </div>

            <div class="form-button-container">
                <button id="login-button" type="submit"> <b> Cambiar contraseña </b> </button>
            </div>
        </form>
    </div>

    <script src="../js/cambiar_contrasena.js"></script>

</body>
</html>
