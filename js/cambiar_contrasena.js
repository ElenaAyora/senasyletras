// Func que afecta al Menú Hmburguesa
const button = document.querySelector('.button')
const nav    = document.querySelector('.nav')

button.addEventListener('click',()=>{
    nav.classList.toggle('activo')
})

// Selecciona todos los inputs con la clase form-control (formulario login)
const inputs = document.querySelectorAll('.form-control');

inputs.forEach(input => {
    
    input.addEventListener('input', function() {
        // Si el campo tiene texto, añade la clase 'input-filled'
        if (this.value.trim() !== '') {
            this.classList.add('input-filled');
        } else {
            // Si está vacío, remueve la clase 'input-filled'
            this.classList.remove('input-filled');
        }
    });
});


// Función para mostrar errores y mensajes de la URL
window.onload = function() {
    const urlParams = new URLSearchParams(window.location.search);
    const error = urlParams.get("error");
    const mensaje = urlParams.get("mensaje");

    console.log("Error param:", error);
    console.log("Mensaje param:", mensaje);

    // Manejo de errores
    if (error === "sin_sesion") {
        alert("Debes iniciar sesión para cambiar tu contraseña.");
    } else if (error === "contrasena_no_coincide") {
        alert("Las contraseñas nuevas no coinciden.");
    } else if (error === "contrasena_incorrecta") {
        alert("La contraseña antigua no es correcta.");
    } else if (error === "usuario") {
        alert("Usuario no válido."); // Si lo sigues usando en algún caso
    }

    // Manejo de mensajes informativos (exitosos)
    if (mensaje === "contrasena_actualizada") {
        alert("Tu contraseña ha sido actualizada correctamente. Por seguridad, inicia sesión nuevamente.");
    }
};
