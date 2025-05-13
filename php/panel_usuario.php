<?php
session_start(); // Iniciar sesión

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Verificar si el usuario está autenticado
$usuario_logeado = isset($_SESSION['id_usuario']); // Si está logeado, true. Si no, false.

include 'db_connection.php'; // Asegúrate de incluir la conexión a la BD

$usuario_id = $_SESSION['id_usuario'];

// 1. Palabras aprendidas totales
$sql_total_palabras = "SELECT COUNT(*) AS total FROM usuario_palabra WHERE id_usuario = $usuario_id"; // Cambié 'usuario_id' por 'id_usuario'
$resultado_total_palabras = mysqli_query($conn, $sql_total_palabras);
$fila_total_palabras = mysqli_fetch_assoc($resultado_total_palabras);
$total_palabras_aprendidas = $fila_total_palabras['total'];

// 2. Palabras aprendidas por categoría (categorías específicas)
$categorias = [1, 2, 3, 17, 18, 19, 12, 11, 13, 14, 16, 15, 4, 6, 7, 8, 9, 10];
$progreso_categorias = [];

foreach ($categorias as $categoria_id) {
    // Total de palabras en la categoría
    $sql_total_cat = "SELECT COUNT(*) AS total FROM palabras WHERE id_categoria = $categoria_id";
    $res_total_cat = mysqli_query($conn, $sql_total_cat);
    $fila_total_cat = mysqli_fetch_assoc($res_total_cat);
    $total_en_categoria = $fila_total_cat['total'];

    // Palabras aprendidas por el usuario en la categoría
    $sql_aprendidas_cat = "
        SELECT COUNT(*) AS total 
        FROM usuario_palabra 
        WHERE id_usuario = $usuario_id
        AND id_palabra IN (SELECT id_palabra FROM palabras WHERE id_categoria = $categoria_id)
    ";
    $res_aprendidas_cat = mysqli_query($conn, $sql_aprendidas_cat);
    $fila_aprendidas_cat = mysqli_fetch_assoc($res_aprendidas_cat);
    $aprendidas_en_categoria = $fila_aprendidas_cat['total'];

    // Guardar en el array
    $progreso_categorias[$categoria_id] = [
        'total' => $total_en_categoria,
        'aprendidas' => $aprendidas_en_categoria
    ];
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Lengua de Señas Española </title>
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="../css/styles-pantalla-peq.css">
</head>
<body>
    <?php include "cabecera.php"?>

    <div class="juegos-container">
        <div class="juegos">
            <h2>Panel de Usuario</h2>
            <br>
            <div class="container">
                <div class="juego1">
                    <h3>Cambiar contraseña</h3>
                    <button onclick="location.href='cambiar_password.php';" class="game-link" target="_blank">Cambiar contraseña</button>
                </div>
                <div class="juego2">
                    <h3>Palabras aprendidas</h3>
                    <button onclick="location.href='palabras_aprendidas.php';"  class="game-link" target="_blank">Palabras aprendidas</button>
                </div>
            </div>
            <br>
            <h2>Insignias conseguidas</h2>
            <div class="insignias-container">
                <!-- Insignias por cantidad de palabras -->
                <img class="img-insignia" src="../imagenes/<?php echo ($total_palabras_aprendidas >= 5) ? 'amarillo_5.png' : 'gris_5.png'; ?>" alt="5 Palabras Aprendidas">
                <img class="img-insignia" src="../imagenes/<?php echo ($total_palabras_aprendidas >= 10) ? 'amarillo_10.png' : 'gris_10.png'; ?>" alt="10 Palabras Aprendidas">
                <img class="img-insignia" src="../imagenes/<?php echo ($total_palabras_aprendidas >= 50) ? 'amarillo_50.png' : 'gris_50.png'; ?>" alt="50 Palabras Aprendidas">
                <img class="img-insignia" src="../imagenes/<?php echo ($total_palabras_aprendidas >= 100) ? 'amarillo_100.png' : 'gris_100.png'; ?>" alt="100 Palabras Aprendidas">
                <img class="img-insignia" src="../imagenes/<?php echo ($total_palabras_aprendidas >= 250) ? 'amarillo_250.png' : 'gris_250.png'; ?>" alt="250 Palabras Aprendidas">
                <img class="img-insignia" src="../imagenes/<?php echo ($total_palabras_aprendidas >= 500) ? 'amarillo_500.png' : 'gris_500.png'; ?>" alt="500 Palabras Aprendidas">
                <!-- Insignias por categorías -->
                <img class="img-insignia" src="../imagenes/<?php echo ($progreso_categorias[1]['aprendidas'] == $progreso_categorias[1]['total'] && $progreso_categorias[1]['total'] > 0) ? 'amarillo_frutas.png' : 'gris_frutas.png'; ?>" alt="Dominio de la Categoria Frutas">
                <img class="img-insignia" src="../imagenes/<?php echo ($progreso_categorias[2]['aprendidas'] == $progreso_categorias[2]['total'] && $progreso_categorias[2]['total'] > 0) ? 'amarillo_verduras.png' : 'gris_verduras.png'; ?>" alt="Dominio de la Categoria Verduras">
                <img class="img-insignia" src="../imagenes/<?php echo ($progreso_categorias[3]['aprendidas'] == $progreso_categorias[3]['total'] && $progreso_categorias[3]['total'] > 0) ? 'amarillo_semillas.png' : 'gris_semillas.png'; ?>" alt="Dominio de la Categoria Semillas">
                <img class="img-insignia" src="../imagenes/<?php echo ($progreso_categorias[17]['aprendidas'] == $progreso_categorias[17]['total'] && $progreso_categorias[17]['total'] > 0) ? 'amarillo_verbos.png' : 'gris_verbos.png'; ?>" alt="Dominio de la Categoria Verbos">
                <img class="img-insignia" src="../imagenes/<?php echo ($progreso_categorias[18]['aprendidas'] == $progreso_categorias[18]['total'] && $progreso_categorias[18]['total'] > 0) ? 'amarillo_adjetivos.png' : 'gris_adjetivos.png'; ?>" alt="Dominio de la Categoria Adjetivos">
                <img class="img-insignia" src="../imagenes/<?php echo ($progreso_categorias[19]['aprendidas'] == $progreso_categorias[19]['total'] && $progreso_categorias[19]['total'] > 0) ? 'amarillo_adverbios.png' : 'gris_adverbios.png'; ?>" alt="Dominio de la Categoria Adverbios">
                <img class="img-insignia" src="../imagenes/<?php echo ($progreso_categorias[12]['aprendidas'] == $progreso_categorias[12]['total'] && $progreso_categorias[12]['total'] > 0) ? 'amarillo_familia.png' : 'gris_familia.png'; ?>" alt="Dominio de la Categoria Familia">
                <img class="img-insignia" src="../imagenes/<?php echo ($progreso_categorias[11]['aprendidas'] == $progreso_categorias[11]['total'] && $progreso_categorias[11]['total'] > 0) ? 'amarillo_interacciones.png' : 'gris_interacciones.png'; ?>" alt="Dominio de la Categoria Interacciones">
                <img class="img-insignia" src="../imagenes/<?php echo ($progreso_categorias[13]['aprendidas'] == $progreso_categorias[13]['total'] && $progreso_categorias[13]['total'] > 0) ? 'amarillo_emociones.png' : 'gris_emociones.png'; ?>" alt="Dominio de la Categoria Emociones">
                <img class="img-insignia" src="../imagenes/<?php echo ($progreso_categorias[14]['aprendidas'] == $progreso_categorias[14]['total'] && $progreso_categorias[14]['total'] > 0) ? 'amarillo_sabores.png' : 'gris_sabores.png'; ?>" alt="Dominio de la Categoria Sabores">
                <img class="img-insignia" src="../imagenes/<?php echo ($progreso_categorias[16]['aprendidas'] == $progreso_categorias[16]['total'] && $progreso_categorias[16]['total'] > 0) ? 'amarillo_cuerpo.png' : 'gris_cuerpo.png'; ?>" alt="Dominio de la Categoria Cuerpo">
                <img class="img-insignia" src="../imagenes/<?php echo ($progreso_categorias[15]['aprendidas'] == $progreso_categorias[15]['total'] && $progreso_categorias[15]['total'] > 0) ? 'amarillo_ropa.png' : 'gris_ropa.png'; ?>" alt="Dominio de la Categoria Ropa">
                <img class="img-insignia" src="../imagenes/<?php echo ($progreso_categorias[4]['aprendidas'] == $progreso_categorias[4]['total'] && $progreso_categorias[4]['total'] > 0) ? 'amarillo_animales.png' : 'gris_animales.png'; ?>" alt="Dominio de la Categoria Animales">
                <img class="img-insignia" src="../imagenes/<?php echo ($progreso_categorias[6]['aprendidas'] == $progreso_categorias[6]['total'] && $progreso_categorias[6]['total'] > 0) ? 'amarillo_week.png' : 'gris_week.png'; ?>" alt="Dominio de la Categoria Semana">
                <img class="img-insignia" src="../imagenes/<?php echo ($progreso_categorias[7]['aprendidas'] == $progreso_categorias[7]['total'] && $progreso_categorias[7]['total'] > 0) ? 'amarillo_mes.png' : 'gris_mes.png'; ?>" alt="Dominio de la Categoria Mes">
                <img class="img-insignia" src="../imagenes/<?php echo ($progreso_categorias[8]['aprendidas'] == $progreso_categorias[8]['total'] && $progreso_categorias[8]['total'] > 0) ? 'amarillo_estaciones.png' : 'gris_estaciones.png'; ?>" alt="Dominio de la Categoria Estaciones">
                <img class="img-insignia" src="../imagenes/<?php echo ($progreso_categorias[9]['aprendidas'] == $progreso_categorias[9]['total'] && $progreso_categorias[9]['total'] > 0) ? 'amarillo_fiesta.png' : 'gris_fiesta.png'; ?>" alt="Dominio de la Categoria Fiestas">
                <img class="img-insignia" src="../imagenes/<?php echo ($progreso_categorias[10]['aprendidas'] == $progreso_categorias[10]['total'] && $progreso_categorias[10]['total'] > 0) ? 'amarillo_tiempo.png' : 'gris_tiempo.png'; ?>" alt="Dominio de la Categoria Tiempo">
            </div>
        </div>
    </div>

    <script src="../js/index.js"></script>

</body>
</html>
