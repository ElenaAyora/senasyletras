<?php

// Verificar si el usuario está autenticado
$usuario_logeado = isset($_SESSION['id_usuario']); // Si está logeado, true. Si no, false.
?>

<html lang="es">
<body>
    <header class="header">
        <button class="button">
            <svg class="svg" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
            </svg>
        </button>

        <nav class="nav">
            <ul class="nav-menu">
                <li class="nav-menu-item"><a class="nav-menu-link nav-link" href="../index.php">Home</a></li>
                <li class="nav-menu-item">
                    <div class="nav-search-container">
                        <form method="GET" action="/php/buscar.php">
                            <input class="nav-search" type="search" name="palabra" placeholder="Buscar . . ." required />
                            <button class="nav-search-button" type="submit"><img src="../imagenes/seach-black.png" alt="Search Icon"></button>
                        </form>
                    </div>
                </li>
            </ul>

            <!-- Menú derecho -->
            <ul class="nav-menu nav-menu-right">
                <!-- Si el usuario está registrado (username, mensaje, cerrar sesion) -->
                <?php if ($usuario_logeado): ?>
                    <li class="nav-menu-item">
                        <a class="saludo" href="/php/panel_usuario.php">Bienvenido, <?php echo htmlspecialchars($_SESSION['userName']); ?></a>
                    </li>
                    <li class="nav-menu-item">
                        <a class="nav-menu-link-mensaje nav-link juegos-nav" href="/php/juegos.php"><img src="../imagenes/game.png" width="20" height="20"></a>
                    </li>
                    <li class="nav-menu-item">
                        <a class="nav-menu-link-mensaje nav-link mensaje-nav" href="/php/mensaje.php"><img src="https://cdn-icons-png.flaticon.com/512/542/542740.png" width="20" height="20"></a>
                    </li>
                    <li class="nav-menu-item">
                        <a class="nav-menu-link logout" href="/php/logout.php">Cerrar sesión</a>
                    </li>
                <!-- Si el usuario no está registrado (login, sign) -->
                <?php else: ?>
                    <li class="nav-menu-item">
                        <a class="nav-menu-link nav-link" href="/login.html">Login</a>
                    </li>
                    <li class="nav-menu-item">
                        <a class="nav-menu-link nav-link" href="/sign.html">Sign</a>
                    </li>
                <?php endif; ?>
            </ul>
        </nav>
    </header>


    <!-- Matomo -->
    <script>
        var _paq = window._paq = window._paq || [];
        /* tracker methods like "setCustomDimension" should be called before "trackPageView" */
        _paq.push(['trackPageView']);
        _paq.push(['enableLinkTracking']);
        (function() {
            var u="https://xnseasyletras2db.matomo.cloud/";
            _paq.push(['setTrackerUrl', u+'matomo.php']);
            _paq.push(['setSiteId', '1']);
            var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
            g.async=true; g.src='https://cdn.matomo.cloud/xnseasyletras2db.matomo.cloud/matomo.js'; s.parentNode.insertBefore(g,s);
        })();
    </script>
<!-- End Matomo Code -->

</body>
</html>