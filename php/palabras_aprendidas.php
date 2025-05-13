<?php
session_start();

// Conectar a la base de datos
include 'db_connection.php';

// Obtener el nombre del usuario
$userName = $_SESSION['userName'];
$id_usuario = $_SESSION['id_usuario'];
$categoriaSeleccionada = isset($_GET['categoria']) ? trim($_GET['categoria']) : '';

// Obtener todas las categorías disponibles desde la tabla `categorias`
$sqlCategorias = "SELECT nombre FROM categorias ORDER BY nombre ASC";
$resultCategorias = $conn->query($sqlCategorias);

$categorias = [];
while ($row = $resultCategorias->fetch_assoc()) {
    $categorias[] = $row['nombre'];
}

// Número de palabras por página
$palabras_por_pagina = 15;
$pagina_actual = isset($_GET['pagina']) ? (int)$_GET['pagina'] : 1;
if ($pagina_actual < 1) $pagina_actual = 1;

// Consultar las palabras, aciertos, contexto y URL de los videos
$sql = "SELECT p.nombre, up.aciertos, v.contexto, v.url_video
        FROM palabras p
        JOIN usuario_palabra up ON p.id_palabra = up.id_palabra
        JOIN videos v ON v.id_video = up.id_video
        JOIN categorias c ON p.id_categoria = c.id_categoria
        WHERE up.id_usuario = ? AND up.aciertos > 0";

$params = [$id_usuario];
$types = "i";

if (!empty($categoriaSeleccionada)) {
    $sql .= " AND c.nombre = ?";
    $params[] = $categoriaSeleccionada;
    $types .= "s";
}

// Contar total de palabras para la paginación
$countSql = "SELECT COUNT(*) as total FROM ($sql) as subconsulta";
$stmtCount = $conn->prepare($countSql);
$stmtCount->bind_param($types, ...$params);
$stmtCount->execute();
$resultCount = $stmtCount->get_result();
$total_palabras = $resultCount->fetch_assoc()['total'];
$total_paginas = ceil($total_palabras / $palabras_por_pagina);
$stmtCount->close();

// Agregar límite para la paginación
$offset = ($pagina_actual - 1) * $palabras_por_pagina;
$sql .= " LIMIT ? OFFSET ?";
$params[] = $palabras_por_pagina;
$params[] = $offset;
$types .= "ii";

$stmt = $conn->prepare($sql);
$stmt->bind_param($types, ...$params);
$stmt->execute();
$result = $stmt->get_result();

$palabras = [];
while ($row = $result->fetch_assoc()) {
    $palabras[] = $row;
}

$stmt->close();
$conn->close();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bienvenido, <?php echo htmlspecialchars($userName); ?></title>
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="../css/styles-bienvenida.css">
</head>
<body>
    <?php include "cabecera.php"?>

    <div class="bienvenida-container">
        <div class="bienvenida-info table-container">
            <h3>Palabras Aprendidas:</h3>
            <div class="seleccion-categoria">
                <!-- Select para filtrar por categoría -->
                <label for="categoria">Selecciona una categoría:</label>
                <select id="categoria" name="categoria" onchange="filtrarCategoria()">
                    <option value="">Todas</option>
                    <?php foreach ($categorias as $categoriaItem): ?>
                        <option value="<?php echo htmlspecialchars($categoriaItem); ?>" 
                            <?php if ($categoriaSeleccionada === $categoriaItem) echo 'selected'; ?>>
                            <?php echo htmlspecialchars($categoriaItem); ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>

            <table id="tabla-palabras">
                <thead>
                    <tr>
                        <th>Palabra</th>
                        <th>Contexto</th>
                        <th>Video</th>
                        <th>Aciertos</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($palabras as $palabra): 
                        $clase = ($palabra['aciertos'] >= 5) ? 'nivel-alto' :
                                 (($palabra['aciertos'] >= 3) ? 'nivel-medio' : 'nivel-bajo');
                    ?>
                        <tr>
                            <td><?php echo htmlspecialchars($palabra['nombre']); ?></td>
                            <td><?php echo htmlspecialchars($palabra['contexto']); ?></td>
                            <td><a href="buscar.php?palabra=<?php echo urlencode($palabra['nombre']); ?>" target="_blank">Video</a></td>
                            <td class="aciertos <?php echo $clase; ?>"><?php echo $palabra['aciertos']; ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>

            <!-- Paginación -->
            <div class="paginacion">
                <?php if ($total_paginas > 1): ?>
                    <?php for ($i = 1; $i <= $total_paginas; $i++): ?>
                        <a href="?pagina=<?php echo $i; ?>&categoria=<?php echo urlencode($categoriaSeleccionada); ?>"
                           class="<?php echo ($i == $pagina_actual) ? 'pagina-activa' : ''; ?>">
                            <?php echo $i; ?>
                        </a>
                    <?php endfor; ?>
                <?php endif; ?>
            </div>
        </div>
    </div>

    <script>
        function filtrarCategoria() {
            const categoria = document.getElementById('categoria').value;
            window.location.href = `?categoria=${encodeURIComponent(categoria)}&pagina=1`;
        }
    </script>


    <script src="../js/index.js"></script>

</body>
</html>
