document.addEventListener('DOMContentLoaded', function () {
    const paginacionDiv = document.getElementById('paginacion');
    const totalPaginas = parseInt(paginacionDiv.getAttribute('data-total'));
    const paginaActual = parseInt(paginacionDiv.getAttribute('data-actual'));

    function determinarPalabrasPorPagina() {
        const anchoPantalla = window.innerWidth;
        if (anchoPantalla <= 1200) return 45; // Pantallas grandes
        if (anchoPantalla <= 992) return 35;  // Tablets
        if (anchoPantalla <= 768) return 25;  // Pantallas medianas
        return 15;                            // Teléfonos
    }

    const palabrasPorPagina = determinarPalabrasPorPagina();

    function mostrarPaginacion(paginasVisibles) {
        let html = '';
        const inicio = Math.max(1, paginaActual - Math.floor(paginasVisibles / 2));
        const fin = Math.min(totalPaginas, inicio + paginasVisibles - 1);

        if (paginaActual > 1) {
            html += `<a href="?token=${token}&pagina=${paginaActual - 1}&palabras_por_pagina=${palabrasPorPagina}" class="boton-paginacion">Anterior</a>`;
        }

        for (let i = inicio; i <= fin; i++) {
            const activo = i === paginaActual ? 'activo' : '';
            html += `<a href="?token=${token}&pagina=${i}&palabras_por_pagina=${palabrasPorPagina}" class="boton-paginacion ${activo}">${i}</a>`;
        }

        if (paginaActual < totalPaginas) {
            html += `<a href="?token=${token}&pagina=${paginaActual + 1}&palabras_por_pagina=${palabrasPorPagina}" class="boton-paginacion">Siguiente</a>`;
        }

        paginacionDiv.innerHTML = html;
    }

    function ajustarPaginacion() {
        const paginasVisibles = window.innerWidth < 768 ? 3 : (window.innerWidth < 1024 ? 5 : 7);
        mostrarPaginacion(paginasVisibles);
    }

    window.addEventListener('resize', ajustarPaginacion);
    ajustarPaginacion();
});
