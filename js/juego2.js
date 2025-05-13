// Func que afecta al Menú Hmburguesa
const button = document.querySelector('.button')
const nav    = document.querySelector('.nav')

button.addEventListener('click',()=>{
    nav.classList.toggle('activo')
})

document.getElementById("validar").addEventListener("click", function () {
    let respuestas = [];

    // Cambié la clase de .video-box a .video-box-juego2 para que coincida con tu HTML
    document.querySelectorAll(".video-box-juego2").forEach(videoBox => {
        let id_video = videoBox.querySelector(".video-id").value;
        let id_palabra = videoBox.querySelector(".palabra-seleccionada").value;

        if (id_palabra) {
            respuestas.push({ id_video, id_palabra });
        }
    });

    if (respuestas.length !== 3) {
        mostrarModal("⚠️ Debes seleccionar una palabra para cada video.");
        return;
    }

    fetch("../php/juego2.php", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(respuestas)
    })
    .then(response => response.json())
    .then(data => {
        let mensaje;
        if (data.aciertos === 3) {
            mensaje = `🎉¡Perfecto!🎉 Has acertado todas las palabras.`;
        } else if (data.aciertos > 0) {
            mensaje = `✅ Has acertado ${data.aciertos} de 3 palabras.`;
        } else {
            mensaje = `❌ Lo siento, no acertaste ninguna.`;
        }

        mostrarModal(mensaje);
    })
    .catch(error => console.error("Error:", error));
});

// Función para mostrar el modal con el mensaje recibido
function mostrarModal(mensaje) {
    document.getElementById("mensajeTexto").innerText = mensaje;
    document.getElementById("mensajeModal").style.display = "block";
}

// Cerrar el modal al hacer clic en "Aceptar"
document.getElementById("cerrarModal").addEventListener("click", function () {
    document.getElementById("mensajeModal").style.display = "none";
    cargarNuevosVideos();
});

document.getElementById("saltar").addEventListener("click", function () {
    cargarNuevosVideos();
});

function cargarNuevosVideos() {
    location.reload(); // Recargar la página para obtener nuevos videos
}
