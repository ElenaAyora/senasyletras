<?php
session_start();

// Si no está logueado, redirigir a login
if (!isset($_SESSION['id_usuario'])) {
    header("Location: login.html");
    exit;
}

// Incluir la conexión a la base de datos
require_once 'db_connection.php';

// Obtener datos del usuario
$id_usuario = $_SESSION['id_usuario'];
$rol = $_SESSION['rol'];
$mensajes = [];

$success_message = '';
$error_message = '';

// Procesar el formulario si se envió
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $mensaje = trim($_POST['mensaje']);

    if (!empty($mensaje)) {
        // Buscar al administrador
        $stmt_admin = $conn->prepare("SELECT id_usuario FROM usuarios WHERE rol = 'admin' LIMIT 1");
        $stmt_admin->execute();
        $result_admin = $stmt_admin->get_result();
        $admin = $result_admin->fetch_assoc();
        $stmt_admin->close();

        if ($admin) {
            $id_admin = $admin['id_usuario'];

            // Insertar mensaje
            $stmt_insert = $conn->prepare("INSERT INTO mensajes (emisor, receptor, mensaje, estado, fecha_envio) VALUES (?, ?, ?, 'pendiente', NOW())");
            $stmt_insert->bind_param("iis", $id_usuario, $id_admin, $mensaje);

            if ($stmt_insert->execute()) {
                $success_message = "Mensaje enviado correctamente.";
            } else {
                $error_message = "Error al enviar el mensaje.";
            }

            $stmt_insert->close();
        } else {
            $error_message = "No se encontró un administrador.";
        }
    } else {
        $error_message = "El mensaje no puede estar vacío.";
    }
}

// Verificar si es administrador o usuario normal
if ($rol === 'admin') {
    // ADMIN: obtiene los mensajes recibidos
    $query = "
        SELECT m.id_mensaje, m.fecha_envio, m.fecha_respuesta, u.userName, m.mensaje, m.estado
        FROM mensajes m
        JOIN usuarios u ON m.emisor = u.id_usuario
        WHERE m.receptor = ? 
        ORDER BY m.fecha_envio DESC
    ";
} else {
    // USUARIO NORMAL: obtiene los mensajes enviados
    $query = "SELECT id_mensaje, fecha_envio, mensaje, estado FROM mensajes WHERE emisor = ? ORDER BY fecha_envio DESC";
}

// Preparar y ejecutar consulta
$stmt = $conn->prepare($query);
$stmt->bind_param('i', $id_usuario);
$stmt->execute();
$result = $stmt->get_result();

// Almacenar los mensajes en un array
while ($row = $result->fetch_assoc()) {
    // Codificar el ID del mensaje en base64 para mayor seguridad
    $row['id_mensaje_encoded'] = base64_encode($row['id_mensaje']);
    $mensajes[] = $row;
}

// Cerrar la conexión
$stmt->close();
$conn->close();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mensajes - <?php echo $rol === 'admin' ? 'Administrador' : 'Usuario'; ?></title>
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="../css/styles-mensajes.css">
</head>
<body>
    <?php include "cabecera.php"?>

    <div class="enviar-mensaje-container">
        <div class="contenedor-mensaje">
            <h2 class="titulo-enviar-mensaje">Enviar Mensaje al Administrador</h2>

            <?php if (!empty($success_message)): ?>
                <p class="success"><?php echo htmlspecialchars($success_message); ?></p>
            <?php endif; ?>

            <?php if (!empty($error_message)): ?>
                <p class="error"><?php echo htmlspecialchars($error_message); ?></p>
            <?php endif; ?>
            <div class="mensaje-formulario">
                <form action="enviar_mensaje.php" method="POST">
                    <textarea class="mensaje" name="mensaje" placeholder="Escribe tu mensaje aquí..." required></textarea>
                    <div class="response-actions">
                        <button class="respuesta-botton" type="submit">Enviar Mensaje</button>
                        <button class="close-button" type="button" onclick="window.location.href='mensaje.php';">Cerrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="mensaje-final-pag">
        <p>
            Se recuerda que sólo se puede enviar mensajes únicamente al administrador con el fin de realizar consultas, sugerencias y o reportar problemas con la aplicación.
        </p>
    </div>

    <script src="../js/mensaje.js"></script>

</body>
</html>
