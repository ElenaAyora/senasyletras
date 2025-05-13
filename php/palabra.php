<?php
// Iniciar sesión
session_start();

// Si estás en local, usa localhost. En producción, pon tu dominio.
$base_url = "https://41174366.servicio-online.net"; 


ini_set('display_errors', 1);
error_reporting(E_ALL);

if (isset($_GET['token'])) {
    $id = $_GET['token'];
} else {
    // Redirigir o mostrar un error si el parámetro no está presente
    die('El parámetro id no está presente.');
}

// Inicializo las variables
$nomb_palabra = "Desconocida";
$contexto_video = [];
$rutas_imagenes = [];

// Función para verificar un token
function verificarToken($token, $id) {
    $clave_secreta = "clave_super_secreta"; // Debe coincidir con la clave usada en categoria.php
    return hash_hmac('sha256', $id, $clave_secreta) === $token;
}

// Función para eliminar acentos (la misma que usas en buscar.php)
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

// Verificar si hay un token en la URL
if (isset($_GET['token'])) {
    $token = $_GET['token']; // Obtener el token desde la URL

    // Verificar si el token existe en la sesión
    if (isset($_SESSION['palabra_tokens'][$token])) {
        // Obtener el ID de la palabra asociado con el token
        $id_palabra = $_SESSION['palabra_tokens'][$token];

        // Validar el token
        if (!verificarToken($token, $id_palabra)) {
            echo "Token no válido.";
            exit;
        }

        // Consulta a la base de datos
        include 'db_connection.php';

        // Consulta SQL => obtener el nombre de la palabra
        $consulta_nomb = $conn->prepare("
            SELECT p.nombre AS palabra_nombre 
            FROM palabras p 
            WHERE p.id_palabra = ?
        ");
        $consulta_nomb->bind_param("i", $id_palabra);    // Saca el número que se pasa a id_palabra por la URL
        $consulta_nomb->execute();                       // Ejecuta la consulta preparada.
        $resultado = $consulta_nomb->get_result();       // Muestra los resultados de la consulta

        // Verificar si se encontraron resultados
        if ($resultado->num_rows > 0) {
            $fila = $resultado->fetch_assoc();
            $nomb_palabra = $fila['palabra_nombre'];
        } else {
            echo "No se encontró la palabra con ese ID.";
            exit;
        }

        // Consulta SQL => obtener videos y contextos asociados a la palabra
        $videos_consul = $conn->prepare("
            SELECT v.contexto, v.url_video
            FROM videos v
            WHERE v.id_palabra = ?
        ");
        $videos_consul->bind_param("i", $id_palabra);         // Saca el número que se pasa a id_palabra por la URL
        $videos_consul->execute();                            // Ejecuta la consulta preparada.
        $resultado_videos = $videos_consul->get_result();     // Muestra los resultados de la consulta

        while ($video = $resultado_videos->fetch_assoc()) {
            $contexto_video[] = $video;   // Agregar cada fila a la lista de videos y contextos
        }

        // Incluir el script que contiene la función obtener_rutas_imagenes
        include 'obtener_rutas_imagenes.php';

        // Normalizamos el nombre de la palabra para obtener las imágenes correctas
        $nombre_normalizado = eliminar_acentos($nomb_palabra);

        // Llamar a la función pasando el nombre normalizado
        $rutas_imagenes = obtener_rutas_imagenes($nombre_normalizado);

        // Liberar recursos
        $consulta_nomb->close();
        $videos_consul->close();
    } else {
        echo "Token no válido.";
        exit;
    }
} else {
    echo "No se ha pasado un token válido.";
    exit;
}

// Cerrar la conexión a la base de datos
$conn->close();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>LSE - <?php echo htmlspecialchars($nomb_palabra); ?></title>
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
            <h2>Palabra seleccionada: <span class="texto-azul"><?php echo htmlspecialchars($nomb_palabra); ?></span></h2>
        </div>

        <!-- Columna Izquierda -->
        <div class="row-video">
            <!-- Columna para los Videos y Contextos -->
            <?php if (!empty($contexto_video)): ?>
                <?php foreach ($contexto_video as $video): ?>
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
                <p>No se encontraron videos o contextos asociados a esta palabra.</p>
            <?php endif; ?>
        </div>

        <!-- Información del deletreo dactilológico -->
        <h3 class="deletreo">Representación Dactilológica:</h3>
        <div class="row-dactilologico">
            <?php if (!empty($rutas_imagenes)): ?>
                <?php foreach ($rutas_imagenes as $img): ?>
                    <img src="<?php echo $base_url . '/' . ltrim($img, '/'); ?>" alt="Imagen de deletreo dactilológico" onclick="openImage(this.src)">
                <?php endforeach; ?>
            <?php else: ?>
                <!-- Esto nunca va a saltar, porque siempre se va a encontrar las imagenes asociadas al deletreo -->
                <p>No se encontraron imágenes asociadas a esta palabra.</p>
            <?php endif; ?>
        </div>

        <!-- Overlay para mostrar la imagen ampliada -->
        <div id="overlay" class="overlay">
            <span id="close" class="close-btn">&times;</span>
            <img id="expandedImg" class="expanded-img" src="" alt="Imagen ampliada">
        </div>
    </div>

    <div class="mensaje-final-pag3">
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