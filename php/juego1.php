<?php
session_start();
$base_url = "https://41174366.servicio-online.net";
include 'db_connection.php';

$id_usuario = $_SESSION['id_usuario']; // Usuario logueado

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener datos enviados por JavaScript
    $respuesta = json_decode(file_get_contents("php://input"), true);

    // Validar que los datos hayan llegado
    if (empty($respuesta['id_video']) || empty($respuesta['palabra_ingresada'])) {
        echo json_encode(["error" => "Faltan datos."]);
        exit();
    }

    $id_video = intval($respuesta['id_video']);
    $palabra_ingresada = trim($respuesta['palabra_ingresada']);

    // Obtener la palabra asociada al video
    $sql = "SELECT p.id_palabra, p.nombre, v.url_video, v.contexto 
            FROM videos v
            JOIN palabras p ON v.id_palabra = p.id_palabra
            WHERE v.id_video = ?";
    $stmt = $conn->prepare($sql);
    if (!$stmt) {
        echo json_encode(["error" => "Error al preparar la consulta: " . $conn->error]);
        exit();
    }

    $stmt->bind_param("i", $id_video);
    $stmt->execute();
    $stmt->bind_result($id_palabra_correcta, $palabra_correcta, $url_video, $contexto);
    $stmt->fetch();
    $stmt->close();

    // Verificar si la respuesta es correcta
    if (strtolower($palabra_ingresada) === strtolower($palabra_correcta)) {
        // Respuesta correcta: insertar o actualizar la relación en la tabla usuario_palabra
        $sql_check = "SELECT aciertos FROM usuario_palabra WHERE id_usuario = ? AND id_video = ?";
        $stmt = $conn->prepare($sql_check);
        if (!$stmt) {
            echo json_encode(["error" => "Error al preparar la consulta de verificación: " . $conn->error]);
            exit();
        }

        $stmt->bind_param("ii", $id_usuario, $id_video);
        $stmt->execute();
        $stmt->bind_result($aciertos_actuales);
        $stmt->fetch();
        $stmt->close();

        if ($aciertos_actuales === null) {
            // Si no existe el registro, insertar nuevo
            $sql_insert = "INSERT INTO usuario_palabra (id_usuario, id_palabra, id_video, url_video, aciertos) 
                           VALUES (?, ?, ?, ?, 1)";
            $stmt = $conn->prepare($sql_insert);
            if (!$stmt) {
                echo json_encode(["error" => "Error al preparar la consulta de inserción: " . $conn->error]);
                exit();
            }

            $stmt->bind_param("iiis", $id_usuario, $id_palabra_correcta, $id_video, $url_video);
            $stmt->execute();
            if ($stmt->affected_rows > 0) {
                echo json_encode(["correcta" => true, "mensaje" => "¡Respuesta correcta!"]);
            } else {
                echo json_encode(["error" => "Error al insertar en la base de datos."]);
            }
            $stmt->close();
        } else {
            // Si ya existe el registro, actualizar aciertos
            $nuevo_acierto = min($aciertos_actuales + 1, 5); // No superar 5 aciertos
            $sql_update = "UPDATE usuario_palabra SET aciertos = ? WHERE id_usuario = ? AND id_video = ?";
            $stmt = $conn->prepare($sql_update);
            if (!$stmt) {
                echo json_encode(["error" => "Error al preparar la consulta de actualización: " . $conn->error]);
                exit();
            }

            $stmt->bind_param("iii", $nuevo_acierto, $id_usuario, $id_video);
            $stmt->execute();
            if ($stmt->affected_rows > 0) {
                echo json_encode(["correcta" => true, "mensaje" => "¡Respuesta correcta!"]);
            } else {
                echo json_encode(["error" => "No se pudo actualizar los aciertos."]);
            }
            $stmt->close();
        }
    } else {
        // Respuesta incorrecta: enviar la palabra correcta
        echo json_encode(["correcta" => false, "mensaje" => "Respuesta incorrecta. La palabra correcta es: " . $palabra_correcta]);
    }
    exit();
}

// Obtener un video aleatorio con su palabra y contexto
$sql = "SELECT v.id_video, v.url_video, v.contexto, p.id_palabra, p.nombre 
        FROM videos v
        JOIN palabras p ON v.id_palabra = p.id_palabra
        ORDER BY RAND() LIMIT 1";
$result = $conn->query($sql);
$video = $result->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adivinanza Palabra LSE</title>
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="../css/styles-juego1.css">
</head>
<body>
    <?php include "cabecera.php"?>
    
    <div class="contenedor-juego1">
        <h2 class="titulo-juego1" >Adivina la palabra</h2>
        <div class="video-container-juego1">
            <div class="video-box-juego1">
                <video width="300" controls>
                    <source src="<?php echo $base_url . '/' . ltrim($video['url_video'], '/'); ?>" type="video/mp4">
                </video>

                <?php if (!empty($video['contexto'])): ?>
                    <p class="contexto-video-juego1"><strong>Contexto:</strong> <?= $video['contexto'] ?></p>
                <?php endif; ?>

                <div class="input-juego-juego1">
                    <input type="text" id="respuesta" placeholder="Escribe la palabra" />
                    <input type="hidden" id="video-id" value="<?= $video['id_video'] ?>" />
                </div>
            </div>
            
        </div>
        <div class="buttons-juego1">
            <button class="boton-juego1-validar" id="validar">Validar</button>
            <button class="boton-juego1-saltar" id="saltar">Saltar</button>
        </div>
    </div>

    <!-- Ventana Modal -->
    <div id="mensajeModal" class="modal">
        <div class="modal-content">
            <p id="mensajeTexto"></p>
            <button id="cerrarModal">Aceptar</button>
        </div>
    </div>

    <script src="../js/juego1.js"></script>

</body>
</html>
