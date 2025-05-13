<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Incluir los archivos de PHPMailer desde la carpeta raíz
require_once '../PHPMailer/PHPMailer.php';
require_once '../PHPMailer/SMTP.php';
require_once '../PHPMailer/Exception.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

// Tu conexión a la base de datos
include 'db_connection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $correo = $_POST["correo"];

    // Buscar la contraseña en la base de datos
    $sql = "SELECT contrasena FROM usuarios WHERE correo = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $correo);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        $stmt->bind_result($contrasena);
        $stmt->fetch();

        $mail = new PHPMailer(true);

        try {
            // Configuración del servidor SMTP
            $mail->isSMTP();
            $mail->Host = 'smtp.servidor-correo.net';  // Dirección del servidor SMTP
            $mail->SMTPAuth = true;
            $mail->Username = 'senas_y_letras@xn--seasyletras-2db.com';  // Tu dirección de correo
            $mail->Password = 'Findecurso1998'; // Tu contraseña o App Password de Gmail
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
            $mail->Port = 587;

            // Configuración del correo
            $mail->setFrom('senas_y_letras@xn--seasyletras-2db.com', 'Soporte');
            $mail->addAddress($correo);

            $mail->Subject = 'Recuperación de contraseña';
            $mail->Body = "Hola, tu contraseña es: $contrasena";

            $mail->send();

            echo "<script>alert('Se ha enviado tu contraseña a tu correo.'); window.location.href='../login.html';</script>";
        } catch (Exception $e) {
            echo "<script>alert('Error al enviar el correo: {$mail->ErrorInfo}'); window.location.href='../recuperar.html';</script>";
        }

    } else {
        echo "<script>alert('El correo no está registrado.'); window.location.href='../recuperar.html';</script>";
    }

    $stmt->close();
}

$conn->close();
?>
