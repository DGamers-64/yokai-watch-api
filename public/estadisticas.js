function comprobarYokais() {
    return new Promise((resolve, reject) => {
        fetch(`http://${dominio}/ykw2/yokai/`)
            .then(res => res.json())
            .then(data => {
                contador = data.length
            })
            .finally(() => {
                const insertadosElemento = document.getElementById("ykInsertados");
                insertadosElemento.innerHTML = contador;
                const porcentajeElemento = document.getElementById("ykPorcentaje");
                const porcentaje = (contador / 448) * 100
                porcentajeElemento.innerHTML = porcentaje.toFixed(2)
                resolve(contador);
            })
            .catch(err => reject(err));
    });
}

function comprobarComida() {
    return new Promise((resolve, reject) => {
        fetch(`http://${dominio}/ykw2/inventario/`)
            .then(res => res.json())
            .then(data => {
                contador = data[1].longitud
                const insertadosElemento = document.getElementById("comidaInsertados");
                insertadosElemento.innerHTML = contador;
                const porcentajeElemento = document.getElementById("comidaPorcentaje");
                const porcentaje = (contador / 74) * 100
                porcentajeElemento.innerHTML = porcentaje.toFixed(2)
                resolve(contador);
            })
            .catch(err => reject(err));
    });
}
function comprobarObjetos() {
    return new Promise((resolve, reject) => {
        fetch(`http://${dominio}/ykw2/inventario/`)
            .then(res => res.json())
            .then(data => {
                contador = data[0].longitud
                const insertadosElemento = document.getElementById("objetosInsertados");
                insertadosElemento.innerHTML = contador;
                const porcentajeElemento = document.getElementById("objetosPorcentaje");
                const porcentaje = (contador / 127) * 100
                porcentajeElemento.innerHTML = porcentaje.toFixed(2)
                resolve(contador);
            })
            .catch(err => reject(err));
    });
}
function comprobarEquipamiento() {
    return new Promise((resolve, reject) => {
        fetch(`http://${dominio}/ykw2/inventario/`)
            .then(res => res.json())
            .then(data => {
                contador = data[2].longitud
                const insertadosElemento = document.getElementById("equipamientoInsertados");
                insertadosElemento.innerHTML = contador;
                const porcentajeElemento = document.getElementById("equipamientoPorcentaje");
                const porcentaje = (contador / 67) * 100
                porcentajeElemento.innerHTML = porcentaje.toFixed(2)
                resolve(contador);
            })
            .catch(err => reject(err));
    });
}

function calcularMediaPonderada() {
    const porcentajeYokai = parseFloat(document.getElementById("ykPorcentaje").innerHTML)
    const porcentajeObjetos = parseFloat(document.getElementById("objetosPorcentaje").innerHTML)
    const porcentajeComida = parseFloat(document.getElementById("comidaPorcentaje").innerHTML)
    const porcentajeEquipamiento = parseFloat(document.getElementById("equipamientoPorcentaje").innerHTML)

    const valores = [porcentajeYokai, porcentajeObjetos, porcentajeComida, porcentajeEquipamiento]
    const pesos = [448, 74, 127, 67]

    const porcentajeTotal = document.getElementById("porcentajeTotal")

    if (valores.length !== pesos.length) {
        throw new Error('Los arreglos de valores y pesos deben tener la misma longitud');
    }

    let sumaProductos = 0;
    let sumaPesos = 0;

    for (let i = 0; i < valores.length; i++) {
        sumaProductos += valores[i] * pesos[i];
        sumaPesos += pesos[i];
    }

    total = sumaProductos / sumaPesos

    porcentajeTotal.innerHTML = total.toFixed(2)
}

async function estadisticas() {
    await comprobarYokais()
    await comprobarObjetos()
    await comprobarComida()
    await comprobarEquipamiento()
    calcularMediaPonderada()
    const estadisticas = document.getElementById("estadisticas")
    estadisticas.style.display = "block"
}