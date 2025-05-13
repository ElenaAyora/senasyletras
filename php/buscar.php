<?php
session_start();  // Asegúrate de iniciar la sesión al principio del archivo
$base_url = "https://41174366.servicio-online.net"; 
// Incluir la conexión a la base de datos
include('db_connection.php');
// Incluir la función para obtener las rutas de imágenes
include('obtener_rutas_imagenes.php');  // Incluimos el archivo que contiene la función


// ➡️ FUNCION NUEVA para eliminar acentos
function eliminar_acentos($cadena) {
    $acentos = array(
        'á' => 'a',
        'à' => 'a',
        'ä' => 'a',
        'é' => 'e',
        'è' => 'e',
        'ë' => 'e',
        'í' => 'i',
        'ì' => 'i',
        'ï' => 'i',
        'ó' => 'o',
        'ò' => 'o',
        'ö' => 'o',
        'ú' => 'u',
        'ù' => 'u',
        'ü' => 'u'
    );
    return strtr($cadena, $acentos);
}

// Verificar si el usuario está logeado
$usuario_logeado = isset($_SESSION['usuario_id']);  // Suponiendo que 'usuario_id' es la variable de sesión

// Inicializamos la variable para controlar si no se encuentran resultados
$no_disponible = false;

// Verificar si se ha recibido el parámetro 'palabra' desde el formulario
if (isset($_GET['palabra'])) {
    // Obtener el valor de la palabra buscada
    $nombre_buscado = $_GET['palabra'];

    // Creo una versión sin acentos solo para obtener las imágenes
    $nombre_normalizado = eliminar_acentos($nombre_buscado);

    // Consulta SQL para obtener los videos y contextos
    $sql = "SELECT p.nombre AS nom_palabra, v.contexto, v.url_video
            FROM videos v
            LEFT JOIN palabras p ON v.id_palabra = p.id_palabra
            WHERE p.nombre = ?";

    // Preparar la consulta
    $consulta = $conn->prepare($sql);
    // Vinculamos el parámetro, que es de tipo string
    $consulta->bind_param("s", $nombre_buscado);
    // Ejecutar la consulta
    $consulta->execute();
    // Obtener los resultados
    $result = $consulta->get_result();

    // Verificar si se obtuvieron resultados
    if ($result->num_rows > 0) {
        // Mostrar los resultados de los videos
        while ($row = $result->fetch_assoc()) {
            $videos_contextos[] = $row;
        }
    } else {
        // Si no se encuentra la palabra en los videos, marcar como no disponible
        $no_disponible = true;
    }

    // Ahora, en lugar de usar la consulta SQL para las imágenes, usamos la función de obtener_rutas_imagenes
    $rutas_imagenes = obtener_rutas_imagenes($nombre_normalizado);  // Llamamos a la función para obtener las rutas de imágenes

    // Cerrar la consulta
    $consulta->close();
} else {
    echo "No se ha proporcionado ninguna palabra para buscar.";
    exit;
}

// Cerrar la conexión a la base de datos
$conn->close();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>LSE - <?php echo htmlspecialchars($nombre_buscado); ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="../css/styles-palabras.css">
    <link rel="stylesheet" href="../css/styles-pantalla-peq.css">
</head>

<body>
    <?php include "cabecera.php"?>

    <div class="palabra-info-container">
        <div class="palabra-nombre">
            <!-- Muestra el "nombre" de la palabra de la tabla palabras -->
            <h2>Palabra seleccionada: <span class="texto-azul"><?php echo htmlspecialchars($nombre_buscado); ?></span></h2>
        </div>

        <!-- Columna Izquierda -->
        <div class="row-video">
            <!-- Columna para los Videos y Contextos -->
            <?php if (!empty($videos_contextos)): ?>
                <?php foreach ($videos_contextos as $video): ?>
                    <div class="context-video-box">
                        <?php if (!empty($video['contexto'])): ?>
                            <h3>Contexto:</h3> <p><?php echo htmlspecialchars($video['contexto']); ?></p>
                        <?php endif; ?>

                        <?php if (!empty($video['url_video'])): ?>
                            <video controls>
                            <source src="<?php echo $base_url . '/' . ltrim($video['url_video'], '/'); ?>" type="video/mp4">
                                Tu navegador no soporta el elemento de video.
                            </video>
                        <?php endif; ?>
                    </div>
                <?php endforeach; ?>
            <?php else: ?>
                <!-- Aquí reemplazamos el mensaje de texto con la imagen "no disponible" -->
                <img src="../imagenes/no-disponible.png" alt="No tenemos este video" />
                <h2 class=mensaje-video> No tenemos este video </h2>
            <?php endif; ?>
        </div>

        <!-- Información del deletreo dactilológico -->
        <h3 class="deletreo">Representación Dactilológica:</h3>
        <div class="row-dactilologico">
            <?php if (!empty($rutas_imagenes)): ?>
                <?php foreach ($rutas_imagenes as $ruta): ?>
                    <img src="<?php echo $base_url . '/' . ltrim($ruta, '/'); ?>" alt="Imagen de deletreo dactilológico" onclick="openImage(this.src)">
                <?php endforeach; ?>
            <?php else: ?>
                <p>No se encontraron imágenes asociadas a esta palabra.</p>
            <?php endif; ?>
        </div>

        <!-- Overlay para mostrar la imagen ampliada -->
        <div id="overlay" class="overlay">
            <span id="close" class="close-btn">&times;</span>
            <img id="expandedImg" class="expanded-img" src="" alt="Imagen ampliada">
        </div>
    </div>

    <div class="mensaje-final-pag">
        <p>
            El objetivo de esta página es acercar la Lengua de Señas Española (LSE) a todas aquellas personas interesadas en aprenderla. ¡Esperamos que encuentres útil y educativo nuestro contenido!
        </p>

        <p>
            Desarrollado por Elena Ayora García. LinkedIn: <a href="https://www.linkedin.com/in/elena-ayora/"> www.linkedin.com/in/elena-ayora</a>
        </p>
    </div>
    
    <script src="../js/palabra.js"></script>

</body>
</html>
