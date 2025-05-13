// Func que afecta al Menú Hmburguesa
const button = document.querySelector('.button')
const nav    = document.querySelector('.nav')

button.addEventListener('click',()=>{
    nav.classList.toggle('activo')
})


// Cambiar color estado mensaje dependiendo de si está pendiente o resuelto
document.addEventListener("DOMContentLoaded", function () {
    const estados = document.querySelectorAll("td:nth-child(5)"); // Selecciona todas las celdas de la columna "Estado"
    
    estados.forEach(td => {
        const estado = td.textContent.trim().toLowerCase();

        if (estado === "pendiente") {
            td.style.color = "orange";
            td.style.fontWeight = "bold";
        } else if (estado === "resuelto") {
            td.style.color = "forestgreen";
            td.style.fontWeight = "bold";
        }
    });
});
