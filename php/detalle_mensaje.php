<?php
session_start();

// Verificar si el usuario está logueado
if (!isset($_SESSION['id_usuario'])) {
    header("Location: login.html");
    exit;
}

// Incluir conexión a la base de datos
require_once 'db_connection.php';

// Verificar que el ID del mensaje fue pasado en la URL
if (!isset($_GET['id']) || empty($_GET['id'])) {
    echo "ID de mensaje no proporcionado.";
    exit;
}

// Decodificar y validar el ID del mensaje
$id_mensaje = base64_decode($_GET['id']);
if (!filter_var($id_mensaje, FILTER_VALIDATE_INT)) {
    echo "ID de mensaje inválido.";
    exit;
}

// Si el formulario fue enviado
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["respuesta"])) {
    $respuestaAdmin = trim($_POST["respuesta"]);

    if (!empty($respuestaAdmin)) {
        // Actualizar el mensaje en la base de datos
        $query = "UPDATE mensajes 
                  SET estado = 'resuelto', respuesta = ?, fecha_respuesta = NOW()
                  WHERE id_mensaje = ?";
        $stmt = $conn->prepare($query);

        if ($stmt) {
            $stmt->bind_param('si', $respuestaAdmin, $id_mensaje);
            if ($stmt->execute()) {
                header("Location: detalle_mensaje.php?id=" . $_GET['id']);
                exit;
            } else {
                die("Error al ejecutar la consulta: " . $stmt->error);
            }
            $stmt->close();
        } else {
            die("Error en la preparación de la consulta: " . $conn->error);
        }
    } else {
        echo "La respuesta no puede estar vacía.";
    }
}

// Obtener los detalles del mensaje
$query = "SELECT m.id_mensaje, m.fecha_envio, m.fecha_respuesta, u.userName, m.mensaje, m.estado, m.respuesta
          FROM mensajes m
          JOIN usuarios u ON m.emisor = u.id_usuario
          WHERE m.id_mensaje = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param('i', $id_mensaje);
$stmt->execute();
$result = $stmt->get_result();

// Verificar si el mensaje existe
if ($result->num_rows > 0) {
    $mensaje = $result->fetch_assoc();
} else {
    echo "Mensaje no encontrado.";
    exit;
}

$stmt->close();
$conn->close();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bienvenido, <?php echo htmlspecialchars($userName); ?></title>
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="../css/styles-mensajes.css">
    <style>
        
    </style>
</head>
<body>
    <?php include "cabecera.php"?>

    <div class="mensajes-container">
        <div class="mensaje-detalle-container">
            <div class="info-detalles-mensaje">
                <p><strong>Usuario:</strong> <?php echo htmlspecialchars($mensaje['userName']); ?></p>
                <p><strong>Fecha de Envío:</strong> <?php echo htmlspecialchars($mensaje['fecha_envio']); ?></p>
                <p><strong>Fecha de Respuesta:</strong> 
                    <?php echo $mensaje['fecha_respuesta'] ? htmlspecialchars($mensaje['fecha_respuesta']) : 'No respondido'; ?>
                </p>
                <p><strong>Estado:</strong> <?php echo htmlspecialchars($mensaje['estado']); ?></p><br>
                <p><strong>Mensaje Enviado:</strong></p>
                <?php echo nl2br(htmlspecialchars($mensaje['mensaje'])); ?>
            </div>

            <br>
            
            <!-- Si ya hay una respuesta, mostrarla -->
            <div class="info-detalles-mensaje">
                <?php if (!empty($mensaje['respuesta'])): ?>
                    <div class="admin-response">
                        <h3>Respuesta del Administrador:</h3>
                        <p><?php echo nl2br(htmlspecialchars($mensaje['respuesta'])); ?></p>
                    </div>
                <?php endif; ?>
            </div>
            <br>
            <!-- Formulario para Responder al Mensaje -->
            <h3>Responder al Mensaje:</h3>
            <form method="POST">
                <textarea class="respuesta" name="respuesta" required></textarea><br>
                <div class="response-actions">
                    <button class="respuesta-botton" type="submit">Enviar Respuesta</button>
                    <button class="close-button" type="button" onclick="window.location.href='mensaje.php';">Cerrar</button>
                </div>
            </form>
        </div>
    </div>

    <script src="../js/mensaje.js"></script>

</body>
</html>
