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

// Verificar si es administrador o usuario normal
if ($rol === 'admin') {
    // ADMIN: Obtiene los mensajes recibidos
    $query = "
        SELECT m.id_mensaje, m.fecha_envio, m.fecha_respuesta, u.userName, m.mensaje, m.estado
        FROM mensajes m
        JOIN usuarios u ON m.emisor = u.id_usuario
        WHERE m.receptor = ? 
        ORDER BY m.fecha_envio DESC
    ";
} else {
    // USUARIO NORMAL: Obtiene los mensajes enviados
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

    <div class="mensajes-container">
        <div class="mensajes" id="mensajes">
            <div class="header-mensajes">
                <h2><?php echo $rol === 'admin' ? 'Mensajes Recibidos' : 'Mensajes Enviados'; ?></h2>
                <?php if ($rol !== 'admin'): ?>
                    <button class="new-mensaje-botton" onclick="location.href='enviar_mensaje.php';">Nuevo Mensaje</button>
                <?php endif; ?>
            </div>

            <?php if (count($mensajes) > 0): ?>
                <table>
                    <thead>
                        <tr>
                            <th>Fecha de Envío</th>
                            <?php if ($rol === 'admin'): ?>
                                <th>Fecha Respuesta</th>
                                <th>Usuario</th>
                            <?php endif; ?>
                            <th>Mensaje</th>
                            <th>Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($mensajes as $mensaje): ?>
                            <tr onclick="window.location='detalle_mensaje.php?id=<?php echo $mensaje['id_mensaje_encoded']; ?>'">
                                <td><?php echo htmlspecialchars($mensaje['fecha_envio']); ?></td>
                                <?php if ($rol === 'admin'): ?>
                                    <td><?php echo $mensaje['fecha_respuesta'] ? htmlspecialchars($mensaje['fecha_respuesta']) : 'No respondido'; ?></td>
                                    <td><?php echo htmlspecialchars($mensaje['userName']); ?></td>
                                <?php endif; ?>
                                <td><?php echo htmlspecialchars($mensaje['mensaje']); ?></td>
                                <td><?php echo htmlspecialchars($mensaje['estado']); ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            <?php else: ?>
                <p>No tienes mensajes.</p>
            <?php endif; ?>            
        </div>
        </div>
    </div>

    <div class="mensaje-final-pag">
        <p>
            Puedes enviar mensajes únicamente al administrador para realizar consultas, sugerencias o reportar problemas con la aplicación, entre otros.
        </p>
    </div>

    <script src="../js/mensaje.js"></script>

</body>
</html>
