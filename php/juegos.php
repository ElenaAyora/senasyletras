<?php
session_start(); // Iniciar sesión

// Verificar si el usuario está autenticado
$usuario_logeado = isset($_SESSION['id_usuario']); // Si está logeado, true. Si no, false.
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
            <h1>Elige un Juego</h1>
            <div class="container">
                <div class="juego1">
                    <img src="../imagenes/juego1.PNG">
                    <button onclick="location.href='juego1.php';" class="game-link" target="_blank">Jugar Juego 1</button>
                </div>
                <div class="juego2">
                    <img src="../imagenes/juego2.PNG">
                    <button onclick="location.href='juego2.php';"  class="game-link" target="_blank">Jugar Juego 2</button>
                </div>
            </div>
        </div>
    </div>

    <script src="../js/index.js"></script>

</body>
</html>
