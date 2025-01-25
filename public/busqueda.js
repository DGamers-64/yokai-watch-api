async function buscarYokai() {
    const buscar = document.getElementById("busquedaYokai").value
    const tablaInfo = document.getElementById("infoYokai")
    await fetch(`http://localhost:3000/ykw2/yokai/${buscar}`)
        .then(res => res.json())
        .then(data => {
            yokai = data[0]
            const titulo = document.createElement("p")
            const imagen = document.createElement("img")
            const descripcion = document.createElement("span")

            titulo.className = "tituloInfo"
            imagen.className = "imagenInfo"
            descripcion.className = "descripcionInfo"

            titulo.innerHTML = yokai.infoGeneral.nombre
            imagen.src = yokai.infoGeneral.medalla
            descripcion.innerHTML = yokai.infoGeneral.bio

            tablaInfo.innerHTML = ""
            tablaInfo.style.display = "block"
            
            tablaInfo.appendChild(titulo)
            tablaInfo.appendChild(imagen)
            tablaInfo.appendChild(descripcion)
        })
}

async function buscarObjeto() {
    const buscar = document.getElementById("busquedaObjeto").value
    const tablaInfo = document.getElementById("infoObjeto")
    await fetch(`http://localhost:3000/ykw2/inventario/objeto/${buscar}`)
        .then(res => res.json())
        .then(data => {
            objeto = data[0]
            const titulo = document.createElement("p")
            const imagen = document.createElement("img")
            const descripcion = document.createElement("span")

            titulo.className = "tituloInfo"
            imagen.className = "imagenInfo"
            descripcion.className = "descripcionInfo"

            titulo.innerHTML = objeto.nombre
            imagen.src = objeto.imagen
            descripcion.innerHTML = objeto.descripcion

            tablaInfo.innerHTML = ""
            tablaInfo.style.display = "block"
            
            tablaInfo.appendChild(titulo)
            tablaInfo.appendChild(imagen)
            tablaInfo.appendChild(descripcion)
        })
}

async function buscarComida() {
    const buscar = document.getElementById("busquedaComida").value
    const tablaInfo = document.getElementById("infoComida")
    await fetch(`http://localhost:3000/ykw2/inventario/comida/${buscar}`)
        .then(res => res.json())
        .then(data => {
            comida = data[0]
            const titulo = document.createElement("p")
            const imagen = document.createElement("img")
            const descripcion = document.createElement("span")

            titulo.className = "tituloInfo"
            imagen.className = "imagenInfo"
            descripcion.className = "descripcionInfo"

            titulo.innerHTML = comida.nombre
            imagen.src = comida.imagen
            descripcion.innerHTML = comida.descripcion

            tablaInfo.innerHTML = ""
            tablaInfo.style.display = "block"
            
            tablaInfo.appendChild(titulo)
            tablaInfo.appendChild(imagen)
            tablaInfo.appendChild(descripcion)
        })
}