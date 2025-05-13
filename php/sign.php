<?php
session_start();
include 'db_connection.php';

// Asegúrate de que el formulario está enviando los datos por POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Recibir y sanitizar los datos
    $correo = trim($_POST['correo']);
    $username = trim($_POST['username']);
    $contrasena = trim($_POST['contrasena']);
    $repeat_contrasena = $_POST['repeat-contrasena'];

    // Verificar si los campos están vacíos
    if (empty($correo) || empty($username) || empty($contrasena) || empty($repeat_contrasena)) {
        die("Por favor, completa todos los campos.");
    }

    // Verificamos que las contraseñas coincidan
    if ($contrasena !== $repeat_contrasena) {
        header("Location: ../sign.html?error=contrasena_no_coincide");
        exit();
    }

    // Verificar si el correo ya existe
    $sql = $conn->prepare("SELECT id_usuario FROM usuarios WHERE correo = ?");
    $sql->bind_param("s", $correo); // comprobar que el correo es un string
    $sql->execute();
    $result = $sql->get_result();

    if ($result->num_rows > 0) {
        // Redirigir con error de correo existente
        header("Location: ../sign.html?error=correo_existente");
        exit();
    }

    // Verificar si el username ya existe
    $sql = $conn->prepare("SELECT id_usuario FROM usuarios WHERE userName = ?");
    $sql->bind_param("s", $username); // comprobar que el correo es un string
    $sql->execute();
    $result = $sql->get_result();

    if ($result->num_rows > 0) {
        // Redirigir con error de username existente
        header("Location: ../sign.html?error=username_existente");
        exit();
    }

    // Encriptar la contraseña
    $hashed_password = password_hash($contrasena, PASSWORD_BCRYPT);

    // Insertar el nuevo usuario en la base de datos
    $sql = $conn->prepare("INSERT INTO usuarios (correo, userName, contrasena) VALUES (?, ?, ?)");
    $sql->bind_param("sss", $correo, $username, $hashed_password);

    if ($sql->execute()) {
        // Obtener el ID del nuevo usuario
        $new_user_id = $conn->insert_id;

        // Iniciar sesión automáticamente
        $_SESSION['id_usuario'] = $new_user_id;
        $_SESSION['userName'] = $username;

        // Redirigir a la página principal
        header("Location: ../index.php");
        exit();
    } else {
        // Error al insertar en la base de datos
        die("Error al registrar el usuario: " . $sql->error);
    }

    // Cerrar la consulta
    $sql->close();
}

// Cerrar la conexión
$conn->close();
?>
