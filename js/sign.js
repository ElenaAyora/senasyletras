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


// Función para mostrar errores de la URL (como en login.js)
window.onload = function() {
    const urlParams = new URLSearchParams(window.location.search);
    const error = urlParams.get("error");

    if (error === "correo_existente") {
        alert("Ya existe una cuenta asociada a este correo.");
    } else if (error === "username_existente") {
        alert("El nombre de usuario ya está en uso.");
    } else if (error === "usuario") {
        alert("Usuario no válido.");
    } else if (error === "contrasena_no_coincide") {
        alert("Las contraseñas no coinciden.");
    }
};