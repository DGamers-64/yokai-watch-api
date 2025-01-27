const dominio = window.location.host

async function buscarYokai() {
    const buscar = document.getElementById("busquedaYokai").value
    const tablaInfo = document.getElementById("infoYokai")
    await fetch(`http://${dominio}/ykw2/yokai/${buscar}`)
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
    await fetch(`http://${dominio}/ykw2/inventario/objeto/${buscar}`)
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
    await fetch(`http://${dominio}/ykw2/inventario/comida/${buscar}`)
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

async function buscarEquipamiento() {
    const buscar = document.getElementById("busquedaEquipamiento").value
    const tablaInfo = document.getElementById("infoEquipamiento")
    await fetch(`http://${dominio}/ykw2/inventario/equipamiento/${buscar}`)
        .then(res => res.json())
        .then(data => {
            equipamiento = data[0]
            const titulo = document.createElement("p")
            const imagen = document.createElement("img")
            const descripcion = document.createElement("span")

            titulo.className = "tituloInfo"
            imagen.className = "imagenInfo"
            descripcion.className = "descripcionInfo"

            titulo.innerHTML = equipamiento.nombre
            imagen.src = equipamiento.imagen
            descripcion.innerHTML = equipamiento.descripcion

            tablaInfo.innerHTML = ""
            tablaInfo.style.display = "block"
            
            tablaInfo.appendChild(titulo)
            tablaInfo.appendChild(imagen)
            tablaInfo.appendChild(descripcion)
        })
}

async function buscarEndpoint() {
    const texto = document.getElementById("buscador-global-endpoints").value
    const jsonSalida = document.getElementById("json-salida")
    fetch(`http://${dominio}/ykw2/${texto}`)
        .then(res => res.json())
        .then(data => {
            jsonSalida.innerHTML = `<pre class="codigo-json">${JSON.stringify(data, null, 2)}</pre>`
            jsonSalida.style.display = 'block'
        })
}

async function buscarPorParametro(link, button) {
    fetch(`http://${dominio}${link}`)
        .then(res => res.json())
        .then(data => {
            const parentDiv = button.parentElement;
            let resultDiv = parentDiv.querySelector('.div-resultado-endpoint');
            if (!resultDiv) {
                resultDiv = document.createElement('div');
                resultDiv.className = 'div-resultado-endpoint'
                parentDiv.appendChild(resultDiv);
            }
            resultDiv.innerHTML = `<pre class='codigo-json'>${JSON.stringify(data, null, 2)}</pre>`;
        })
}