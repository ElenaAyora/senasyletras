<?php
function obtener_rutas_imagenes($palabra) {
    $base_path = "../img-dicc-dactilologico/";
    $rutas = [];

    // Convertir a minúsculas y quitar tildes
    $palabra = mb_strtolower($palabra, 'UTF-8');
    $palabra = quitar_tildes($palabra);

    // Paso 1: Reemplazamos los dígrafos por símbolos temporales únicos
    $palabra = str_replace(['ch', 'll', 'rr', ' '], ['$', '#', '&', '%'], $palabra);

    // Paso 2: Recorrer la palabra carácter a carácter
    $longitud = mb_strlen($palabra, 'UTF-8');

    for ($i = 0; $i < $longitud; $i++) {
        $letra = mb_substr($palabra, $i, 1, 'UTF-8');

        // Paso 3: Recuperamos los dígrafos si el símbolo es especial
        switch ($letra) {
            case '$':
                $archivo = 'ch.png';
                break;
            case '#':
                $archivo = 'll.png';
                break;
            case '&':
                $archivo = 'rr.png';
                break;
            case '%':
                $archivo = 'espacio.png';
                break;
            default:
                $archivo = $letra . ".png";
                break;
        }

        // Agregamos la ruta al array
        $rutas[] = $base_path . $archivo;
    }

    // Depuración temporal para ver el resultado
    // echo "<pre>"; print_r($rutas); echo "</pre>";

    return $rutas;
}

function quitar_tildes($cadena) {
    $originales = ['á','é','í','ó','ú','à','è','ì','ò','ù','ä','ë','ï','ö','ü'];
    $sin_tildes = ['a','e','i','o','u','a','e','i','o','u','a','e','i','o','u'];
    return str_replace($originales, $sin_tildes, $cadena);
}

?>
