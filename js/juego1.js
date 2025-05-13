// Func que afecta al Menú Hmburguesa
const button = document.querySelector('.button')
const nav    = document.querySelector('.nav')

button.addEventListener('click',()=>{
    nav.classList.toggle('activo')
})

document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("validar").addEventListener("click", function () {
        const palabra_ingresada = document.getElementById("respuesta").value.trim();
        const id_video = document.getElementById("video-id").value;

        // Verifica si la palabra está vacía
        if (!palabra_ingresada) {
            mostrarModal("⚠️ Debes escribir una palabra.");
            return;
        }

        // Verifica los valores antes de enviarlos
        console.log("Palabra ingresada:", palabra_ingresada);  // Verifica que se captura la palabra correctamente
        console.log("ID de video:", id_video);  // Verifica que se captura el ID de video correctamente

        fetch("../php/juego1.php", { 
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ id_video, palabra_ingresada })
        })
        .then(response => response.json())
        .then(data => {
            if (data.error) {
                mostrarModal("Error: " + data.error);
            } else {
                mostrarModal(data.mensaje);
            }
        })
        .catch(error => {
            console.error("Error:", error);
            mostrarModal("Hubo un error al procesar la solicitud.");
        });
    });

    // Función para mostrar el modal con el mensaje
    function mostrarModal(mensaje) {
        document.getElementById("mensajeTexto").innerText = mensaje;
        document.getElementById("mensajeModal").style.display = "block";
    }

    // Cerrar el modal al hacer clic en "Aceptar"
    document.getElementById("cerrarModal").addEventListener("click", function () {
        document.getElementById("mensajeModal").style.display = "none";
        document.getElementById("respuesta").value = "";
        cargarNuevosVideos();// Recargar la página para mostrar un nuevo video
    });

    document.getElementById("saltar").addEventListener("click", function () {
        cargarNuevosVideos();
    });
    
    function cargarNuevosVideos() {
        location.reload(); // Recargar la página para obtener nuevos videos
    }
});
