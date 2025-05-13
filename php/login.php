<?php
session_start();
include 'db_connection.php';

// Asegúrate de que el formulario está enviando los datos por POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Recibir y sanitizar los datos
    $correo = trim($_POST['correo']);
    $contrasena = trim($_POST['contrasena']);

    // Verificar si los campos están vacíos
    if (empty($correo) || empty($contrasena)) {
        die("Por favor, completa todos los campos.");
    }

    // Preparar la consulta para evitar inyección SQL
    $sql = $conn->prepare("SELECT id_usuario, userName, contrasena, rol FROM usuarios WHERE correo = ?");
    $sql->bind_param("s", $correo);
    $sql->execute();
    $result = $sql->get_result();

    // Verificar si se encontró el usuario
    if ($result->num_rows === 1) {
        // Obtener los datos del usuario
        $user = $result->fetch_assoc();

        // Comparar la contraseña recibida con la almacenada
        // Aquí comparamos la contraseña directamente, ya que no está cifrada en la base de datos
        if (password_verify($contrasena, $user['contrasena'])) {
            // Iniciar sesión
            $_SESSION['id_usuario'] = $user['id_usuario'];
            $_SESSION['userName'] = $user['userName'];
            $_SESSION['rol'] = $user['rol'];

            // Redirigir a la página principal (o la página de usuario)
            header("Location: ../index.php");
            exit();
        } else {
            // Contraseña incorrecta, redirigir con error
            header("Location: ../login.html?error=contrasena");
            exit();
        }
    } else {
        // Usuario no encontrado, redirigir con error
        header("Location: ../login.html?error=usuario");
        exit();
    }

    // Cerrar la consulta
    $sql->close();
}

// Cerrar la conexión
$conn->close();
?>
