function desaparecer(boton) {
    const sectionPadre = boton.parentElement
    const hijos = sectionPadre.children
    Array.from(hijos).forEach(hijo => {
        if (hijo.tagName == "SECTION") {
            if (hijo.style.display == "none") {
                hijo.style.display = "block"
                boton.innerHTML = "▼"
            } else {
                hijo.style.display = "none"
                boton.innerHTML = "▲"
            }
        }
    });
}