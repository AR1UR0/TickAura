window.onload = function() {
    const gridItems = document.querySelectorAll('.grid-item');
    gridItems.forEach(item => {
        const eventoNombre = item.textContent;
        const nombreSinEspacios = eventoNombre.toLowerCase().replace(/\s+/g, '');
        const nombreSinAcentos = eliminarAcentos(nombreSinEspacios);
        const nombreImagen = nombreSinAcentos + '.jpg';
        item.style.backgroundImage = `url('../Imagenes/${nombreImagen}')`;
        item.style.backgroundSize = 'cover';
        item.style.backgroundPosition = 'center';
    });

    function eliminarAcentos(str) {
        const acentos = {
            'á': 'a', 'é': 'e', 'í': 'i', 'ó': 'o', 'ú': 'u',
            'Á': 'A', 'É': 'E', 'Í': 'I', 'Ó': 'O', 'Ú': 'U',
            'ñ': 'n', 'Ñ': 'N'
        };

        return str.split('').map(function(c) {
            return acentos[c] || c;
        }).join('');
    }
}
