<?php
// Configuración de la conexión a la base de datos en el hosting
$host = "PMYSQL187.dns-servicio.com";   // Host exacto que te da el panel de control
$usuario = "eag";               // Usuario de la base de datos
$contrasena = "*7Xl0d85q";      // Contraseña del usuario
$base_datos = "10842374_proyecto"; // Nombre de la base de datos

// Crear la conexión
$conn = new mysqli($host, $usuario, $contrasena, $base_datos);

// Verificar la conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
} else {
    // echo "Conexión exitosa"; // Descomenta para verificar conexión
}
// Establecer la codificación de la conexión a utf8mb4 para soportar caracteres especiales
$conn->set_charset("utf8mb4");
?>
