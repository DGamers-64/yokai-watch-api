async function buscarEndpoint() {
    const texto = document.getElementById("buscador-global-endpoints").value
    const jsonSalida = document.getElementById("json-salida")
    fetch(`http://${dominio}/${texto}`)
        .then(res => res.json())
        .then(data => {
            jsonSalida.innerHTML = `<pre class="codigo-json">${JSON.stringify(data, null, 2)}</pre>`
            jsonSalida.style.display = 'block'
        })
}

async function buscarPorParametro(button) {
    const link = button.parentElement.querySelector('.comando-endpoint').innerHTML
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

const dominio = window.location.host