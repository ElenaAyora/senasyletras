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
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/styles-pantalla-peq.css">
</head>
<body>
    <?php include "php/cabecera.php"?>

    <div class="categorias-container">
        <?php
        session_start(); // Iniciar sesión
        $categorias = [
            1 => ['nombre' => 'Frutas', 'imagen' => 'https://cdn-icons-png.flaticon.com/512/2892/2892319.png'],
            2 => ['nombre' => 'Verduras', 'imagen' => 'https://cdn-icons-png.flaticon.com/512/5346/5346481.png'],
            3 => ['nombre' => 'Semillas', 'imagen' => 'https://cdn-icons-png.flaticon.com/512/2771/2771203.png'],
            17 => ['nombre' => 'Verbos', 'imagen' => 'imagenes/verbos.png'],
            18 => ['nombre' => 'Adjetivos', 'imagen' => 'imagenes/adjetivos.png'],
            19 => ['nombre' => 'Adverbios', 'imagen' => 'imagenes/adverbios.png'],
            12 => ['nombre' => 'Familia', 'imagen' => 'https://cdn-icons-png.flaticon.com/512/547/547612.png'],
            11 => ['nombre' => 'Interacciones', 'imagen' => 'https://cdn-icons-png.flaticon.com/512/8171/8171556.png'],
            13 => ['nombre' => 'Emociones', 'imagen' => 'https://cdn-icons-png.flaticon.com/512/12649/12649548.png'],
            14 => ['nombre' => 'Sabores', 'imagen' => 'https://cdn-icons-png.flaticon.com/512/4785/4785959.png'],
            16 => ['nombre' => 'Cuerpo', 'imagen' => 'https://cdn-icons-png.flaticon.com/512/6583/6583997.png'],
            15 => ['nombre' => 'Ropa', 'imagen' => 'https://cdn-icons-png.flaticon.com/512/6971/6971035.png'],
            4 => ['nombre' => 'Animales', 'imagen' => 'https://cdn-icons-png.flaticon.com/512/616/616430.png'],
            5 => ['nombre' => 'Calendario', 'imagen' => 'https://cdn-icons-png.flaticon.com/512/3652/3652191.png'],
            20 => ['nombre' => 'Abecedario', 'imagen' => 'https://cdn-icons-png.flaticon.com/512/12886/12886138.png'],
            21 => ['nombre' => 'Colores', 'imagen' => 'https://cdn-icons-png.flaticon.com/512/3214/3214398.png'],
            22 => ['nombre' => 'Bebidas', 'imagen' => 'https://cdn-icons-png.flaticon.com/512/2738/2738730.png']
        ];

        // Recorremos todas las categorías
        foreach ($categorias as $id_categoria => $categoria) {
            // Generar el token único
            $token = md5(uniqid(rand(), true));
            // Guardar en sesión
            $_SESSION['categoria_tokens'][$token] = $id_categoria;
            ?>
            <div class="categoria">
                <a href="php/categoria.php?token=<?php echo $token; ?>" style="text-decoration: none; color: inherit;">
                    <p><b><?php echo $categoria['nombre']; ?></b></p>
                    <img class="img-categ" src="<?php echo $categoria['imagen']; ?>" alt="<?php echo $categoria['nombre']; ?>">
                </a>
            </div>
            <?php
        }
        ?>
    </div>

    <div class="mensaje-final-pag">
        <p>
            El objetivo de esta página es acercar la Lengua de Señas Española (LSE) a todas aquellas personas interesadas en aprenderla. ¡Esperamos que encuentres útil y educativo nuestro contenido!
        </p>

        <p>
            Desarrollado por Elena Ayora García. LinkedIn: <a href="https://www.linkedin.com/in/elena-ayora/"> www.linkedin.com/in/elena-ayora</a>
        </p>
    </div>

    <script src="js/index.js"></script>

</body>
</html>
