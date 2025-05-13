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


// Función para mostrar el mensaje de error si hay uno en la URL
window.onload = function() {
    // Verificar si hay un parámetro 'error' en la URL
    const urlParams = new URLSearchParams(window.location.search);
    const error = urlParams.get('error');

    if (error === 'usuario') {
        alert("Usuario no válido, correo incorrecto.");
    } else if (error === 'contrasena') {
        alert("Contraseña incorrecta.");
    }
};