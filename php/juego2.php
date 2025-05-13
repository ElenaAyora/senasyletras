<?php
session_start();
$base_url = "https://41174366.servicio-online.net"; 

include 'db_connection.php';

$id_usuario = $_SESSION['id_usuario']; // Usuario logueado
$aciertos = 0;
$resultado = [];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener datos enviados por JavaScript
    $respuestas = json_decode(file_get_contents("php://input"), true);

    foreach ($respuestas as $respuesta) {
        $id_video = intval($respuesta['id_video']);
        $id_palabra = intval($respuesta['id_palabra']);

        // Obtener la palabra correcta para este video
        $sql = "SELECT id_palabra, url_video FROM videos WHERE id_video = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $id_video);
        $stmt->execute();
        $stmt->bind_result($palabra_correcta, $url_video);
        $stmt->fetch();
        $stmt->close();

        if ($palabra_correcta == $id_palabra) {
            $aciertos++;
            
            // Verificar si ya existe un registro en la base de datos para el usuario y palabra
            $sql_check = "SELECT aciertos FROM usuario_palabra WHERE id_usuario = ? AND id_palabra = ?";
            $stmt = $conn->prepare($sql_check);
            $stmt->bind_param("ii", $id_usuario, $id_palabra);
            $stmt->execute();
            $stmt->bind_result($aciertos_actuales);
            $stmt->fetch();
            $stmt->close();

            if ($aciertos_actuales === null) {
                // Si no existe el registro, insertar con 1 acierto
                $sql_insert = "INSERT INTO usuario_palabra (id_usuario, id_palabra, id_video, url_video, aciertos) 
                               VALUES (?, ?, ?, ?, 1)";
                $stmt = $conn->prepare($sql_insert);
                $stmt->bind_param("iiis", $id_usuario, $id_palabra, $id_video, $url_video);
                $stmt->execute();
                $stmt->close();
            } else {
                // Si existe el registro, incrementamos los aciertos pero no superamos 5
                $nuevo_acierto = min($aciertos_actuales + 1, 5); // No superar 5 aciertos

                $sql_update = "UPDATE usuario_palabra SET aciertos = ? WHERE id_usuario = ? AND id_palabra = ?";
                $stmt = $conn->prepare($sql_update);
                $stmt->bind_param("iii", $nuevo_acierto, $id_usuario, $id_palabra);
                $stmt->execute();
                $stmt->close();
            }
        }
    }

    echo json_encode(["aciertos" => $aciertos]);
    exit();
}

// Obtener 3 videos aleatorios con sus palabras y contexto
$sql = "SELECT v.id_video, v.url_video, v.contexto, p.id_palabra, p.nombre 
        FROM videos v
        JOIN palabras p ON v.id_palabra = p.id_palabra
        ORDER BY RAND() LIMIT 3";
$result = $conn->query($sql);

$videos = [];
while ($row = $result->fetch_assoc()) {
    $videos[] = $row;
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Asocia Palabra LSE</title>
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="../css/styles-juego2.css">
</head>
<body>
    <?php include "cabecera.php"?>

    <div class="contenedor-juego2">
        <h1>Asocia las palabras con los videos</h1>
        <div class="video-container-juego2">
            <?php foreach ($videos as $video): ?>
                <div class="video-box-juego2">
                    <video width="200" controls>
                    <source src="<?php echo $base_url . '/' . ltrim($video['url_video'], '/'); ?>" type="video/mp4">
                    </video>

                    <!-- Mostrar contexto si existe -->
                    <?php if (!empty($video['contexto'])): ?>
                        <p><strong>Contexto:</strong> <?= $video['contexto'] ?></p>
                    <?php endif; ?>

                    <!-- Input hidden para guardar la relación de cada video -->
                    <input type="hidden" class="video-id" value="<?= $video['id_video'] ?>">

                    <select class="palabra-seleccionada">
                        <option value="">Selecciona la palabra</option>
                        <?php foreach ($videos as $v): ?>
                            <option value="<?= $v['id_palabra'] ?>"><?= $v['nombre'] ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            <?php endforeach; ?>
        </div>
        <div class="buttons-juego2">
            <button class="boton-juego2-validar" id="validar">Validar</button>
            <button class="boton-juego2-saltar" id="saltar">Saltar tanda</button>
        </div>
    </div>

    <!-- Ventana Modal -->
    <div id="mensajeModal" class="modal">
        <div class="modal-content">
            <p id="mensajeTexto"></p>
            <button id="cerrarModal">Aceptar</button>
        </div>
    </div>

    <script>
        const idUsuario = <?= $id_usuario ?>;
    </script>
    <script src="../js/juego2.js"></script>

</body>
</html>
