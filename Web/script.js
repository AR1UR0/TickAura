async function cargarDetallesEvento() {
    const params = new URLSearchParams(window.location.search);
    const eventoNombre = decodeURIComponent(params.get("evento")).toLowerCase(); // Decodificar y convertir a minúsculas
    
    try {
        // Comparación insensible a mayúsculas/minúsculas
        const evento = event.eventos.find(e => e.artista.toLowerCase() === eventoNombre);
        
        if (evento) {
            console.log('Se ha encontrado evento',evento)
            document.getElementById("evento-nombre").innerText = evento.artista;
            document.getElementById("evento-fecha").innerText = evento.fecha;
            document.getElementById("evento-ubicacion").innerText = evento.ubicacion;
            document.getElementById("evento-precio").innerText = evento.precio;
            document.getElementById("evento-imagen").src = evento.imagen;
            document.getElementById("evento-disponibilidad").textContent = evento.disponible ? "Disponible" : "Agotado";
        } else {
            console.log('NO evento')
            document.getElementById("evento-detalle").innerHTML = "<h2>Evento no encontrado</h2>";
        }
    } catch (error) {
        console.error("Error al cargar el evento", error);
    }
}
cargarDetallesEvento()
