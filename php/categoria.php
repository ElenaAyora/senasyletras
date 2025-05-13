<?php
// Iniciar sesión
session_start();

// Inicializo las variables
$categoria_nombre = "Desconocida";
$palabras = [];

// Función para generar un token codificado
function generarToken($id) {
    $clave_secreta = "clave_super_secreta"; // Cambiar por una clave secreta más segura
    return hash_hmac('sha256', $id, $clave_secreta); // Generar un hash seguro
}

// Verifico que exista el token en la URL
if (isset($_GET['token'])) {
    $token = $_GET['token']; // Cojo el token desde la URL

    // Verificar que el token existe en la sesión
    if (isset($_SESSION['categoria_tokens'][$token])) {
        // Obtener el id_categoria usando el token
        $id_categoria = $_SESSION['categoria_tokens'][$token];

        // Consulta a la Base de Datos
        include 'db_connection.php';

        // Consulta SQL para obtener datos de las siguientes tablas:
        $consulta = $conn->prepare("
            SELECT c.nombre AS nomb_categoria, p.id_palabra, p.nombre AS palabra_nombre 
            FROM categorias c 
            LEFT JOIN palabras p ON c.id_categoria = p.id_categoria 
            WHERE c.id_categoria = ?
        ");
        $consulta->bind_param("i", $id_categoria);  // Saca el número que se pasa a id_categoria por la URL
        $consulta->execute();                       // Ejecuta la consulta preparada.
        $resultado = $consulta->get_result();       // Muestra los resultados de la consulta

        // Verificar si se encontraron resultados
        if ($resultado->num_rows > 0) {
            // Si encuentra los resultados los recorre
            while ($fila = $resultado->fetch_assoc()) {
                if ($categoria_nombre === "Desconocida") {
                    $categoria_nombre = $fila['nomb_categoria']; // Asignar nombre de la categoría
                }
                // Añadir las palabras de las categorías
                if (!empty($fila['palabra_nombre'])) {
                    // Generar el token codificado
                    $token_codificado = generarToken($fila['id_palabra']);
                    $palabras[] = [
                        'token' => $token_codificado, // Aquí asignamos el ID de la palabra como token
                        'nombre' => $fila['palabra_nombre']
                    ];
                    // Guardar el token en la sesión
                    $_SESSION['palabra_tokens'][$token_codificado] = $fila['id_palabra'];
                }
            }
        }

        // Liberar recursos
        $consulta->close();
    } else {
        // Si el token no es válido o no existe
        echo "Token no válido.";
        exit;
    }
} else {
    // Si no se pasó un token, mostrar un error
    echo "No se ha pasado un token válido.";
    exit;
}
// Cierro la conexión a la Base de Datos
$conn->close();

// Número de palabras por página
$palabras_por_pagina = 30;

// Página actual (si no se especifica, será la primera)
$pagina_actual = isset($_GET['pagina']) ? (int)$_GET['pagina'] : 1;
if ($pagina_actual < 1) $pagina_actual = 1;

// Total de palabras y páginas
$total_palabras = count($palabras);
$total_paginas = ceil($total_palabras / $palabras_por_pagina);

// Obtener palabras para la página actual
$inicio = ($pagina_actual - 1) * $palabras_por_pagina;
$palabras_paginadas = array_slice($palabras, $inicio, $palabras_por_pagina);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>LSE - <?php echo htmlspecialchars($categoria_nombre); ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="../css/styles-pantalla-peq.css">
</head>

<body>
    <?php include "cabecera.php"?>

    <div class="categoria-info-container">
        <div class="categoria-nombre">
            <h2>Categoría seleccionada: <span class="texto-azul"><?php echo htmlspecialchars($categoria_nombre); ?></span></h2>
        </div>

        <div class="palabras-container">
            <?php
            $categorias_hijas = ['semana' => 6, 'mes' => 7, 'estaciones' => 8, 'fiestas' => 9, 'tiempo' => 10];

            $imagenes_palabras = [
                'semana' => 'https://cdn-icons-png.flaticon.com/512/10755/10755360.png',
                'mes' => 'https://cdn-icons-png.flaticon.com/512/8701/8701452.png',
                'estaciones' => 'https://cdn-icons-png.flaticon.com/512/7059/7059415.png',
                'fiestas' => 'https://cdn-icons-png.flaticon.com/512/3146/3146600.png',
                'tiempo' => 'https://cdn-icons-png.flaticon.com/512/2784/2784459.png'
            ];
            ?>

            <?php if (!empty($palabras_paginadas)): ?>
                <?php foreach ($palabras_paginadas as $palabra): ?>
                    <?php
                    $nombre_palabra = strtolower($palabra['nombre']);
                    
                    // Verifica si es la categoría 5 y si la palabra tiene una categoría hija
                    if ($id_categoria == 5 && isset($categorias_hijas[$nombre_palabra])) {
                        // Obtener la categoría hija correspondiente
                        $id_categoria_hija = $categorias_hijas[$nombre_palabra];
                
                        // Generar un token único para la categoría hija
                        $token_categoria_hija = md5(uniqid(rand(), true));
                
                        // Guardar el token en la sesión para la categoría hija
                        $_SESSION['categoria_tokens'][$token_categoria_hija] = $id_categoria_hija;
                
                        // Enlace a la categoría hija
                        $link = "categoria.php?token=" . htmlspecialchars($token_categoria_hija);
                
                        // Obtener la imagen asociada a la categoría hija
                        $imagen_url = isset($imagenes_palabras[$nombre_palabra]) ? $imagenes_palabras[$nombre_palabra] : '';
                    } else {
                        // Enlace normal a palabra.php
                        $link = "palabra.php?token=" . htmlspecialchars($palabra['token']);
                
                        $imagen_url = ''; // No hay imagen si es palabra normal
                    }
                    ?>

                    <!-- Mostrar la palabra o el acceso a la subcategoría -->
                    <div class="palabra-item">
                    <a href="palabra.php?token=<?php echo htmlspecialchars($palabra['token']); ?>" class="palabra-link">
                            <div class="palabra-box">
                                <?php if (!empty($imagen_url)): ?>
                                <!-- Mostrar imagen si es una categoría hija -->
                                    <img src="<?php echo htmlspecialchars($imagen_url); ?>" alt="<?php echo htmlspecialchars($palabra['nombre']); ?>" style="width: 100px; height: 100px;">
                                    <p><b><?php echo htmlspecialchars($palabra['nombre']); ?></b></p>
                                <?php else: ?>
                                    <!-- Mostrar solo el nombre si es una palabra normal -->
                                    <p><b><?php echo htmlspecialchars($palabra['nombre']); ?></b></p>
                                <?php endif; ?>
                            </div>
                        </a>
                    </div>

                <?php endforeach; ?>
            <?php else: ?>
                <!-- Si no hay palabras -->
                <p>No hay palabras disponibles para esta categoría.</p>
            <?php endif; ?>
        </div>
    </div>

    <!-- Paginación -->
    <div class="paginacion">
        <?php if ($total_paginas > 1): ?>
            <?php for ($i = 1; $i <= $total_paginas; $i++): ?>
                <?php $link_pagina = "categoria.php?token=" . urlencode($_GET['token']) . "&pagina=" . $i; ?>
                <?php if ($i == $pagina_actual): ?>
                    <a href="<?php echo $link_pagina; ?>" class="pagina-activa"><?php echo $i; ?></a>
                <?php else: ?>
                    <a href="<?php echo $link_pagina; ?>"><?php echo $i; ?></a>
                <?php endif; ?>
            <?php endfor; ?>
        <?php endif; ?>
    </div>

    <div class="mensaje-final-pag2">
        <p>
            El objetivo de esta página es acercar la Lengua de Señas Española (LSE) a todas aquellas personas interesadas en aprenderla. ¡Esperamos que encuentres útil y educativo nuestro contenido!
        </p>

        <p>
            Desarrollado por Elena Ayora García. LinkedIn: <a href="https://www.linkedin.com/in/elena-ayora/"> www.linkedin.com/in/elena-ayora</a>
        </p>
    </div>


    <!-- Script que afecta al menú hamburguesa -->
    <script src="../js/index.js"></script>
    
</body>

</html>
