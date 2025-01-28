function desaparecer(boton) {
    document.getElementById("buscador-global-link-ykw2").innerHTML = `http://${dominio}/ykw2`
    const sectionPadre = boton.parentElement
    const hijos = sectionPadre.children
    Array.from(hijos).forEach(hijo => {
        if (hijo.tagName == "SECTION") {
            if (hijo.style.display == "block") {
                hijo.style.display = "none"
                boton.innerHTML = "▲"
            } else if (hijo.style.display == "none" ) {
                hijo.style.display = "block"
                boton.innerHTML = "▼"
            } else {
                hijo.style.display = "block"
                boton.innerHTML = "▼"
            }
        }
    });
}