// Func que afecta al Menú Hmburguesa
const button = document.querySelector('.button')
const nav    = document.querySelector('.nav')

button.addEventListener('click',()=>{
    nav.classList.toggle('activo')
})


// JAVASCRIPT que afecta a la Ampliación de las Imágenes
// Fun. para abrir las Img's en el overlay
function openImage(src) {
    // Verificar si el archivo es "espacio.png"
    if (src.includes('espacio.png')) {
        return; // No hacer nada si es "espacio.png"
    }
    
    const overlay = document.getElementById('overlay'); // Seleccionamos el overlay
    const expandedImg = document.getElementById('expandedImg'); // Imagen ampliada
    overlay.style.display = 'flex'; // Mostramos el overlay
    expandedImg.src = src; // Asignamos la fuente de la imagen ampliada
}

// Cerrar el overlay al hacer clic en el botón de cerrar
document.getElementById('close').addEventListener('click', function() {
    document.getElementById('overlay').style.display = 'none'; // Ocultar el overlay
});

// Cerrar el overlay si se hace clic fuera de la imagen
document.getElementById('overlay').addEventListener('click', function(event) {
    if (event.target === this) {
        this.style.display = 'none'; // Ocultar el overlay si se hace clic fuera
    }
});