document.addEventListener("DOMContentLoaded", () => {
    const botonInicio = document.getElementById("inic");
    if (botonInicio) {
        botonInicio.addEventListener("click", () => {
            Swal.fire({
                title: "Función no disponible",
                icon: "error",
                toast: true,
                position: "top-end",
                showConfirmButton: false,
                showCloseButton: true,
                background: "#9b30ff",
                color: "#ffffff",
                customClass: {
                    popup: "custom-alert",
                },
                timer: 3000,
                timerProgressBar: true
            });
        });
    }
});
