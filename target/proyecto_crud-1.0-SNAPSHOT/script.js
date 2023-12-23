//Creo el valor del boleto
let valorTicket = 200;

//Creo un array de objetos con los tipos de boletos disponibles

const boletos = {
    Estudiante: .2,
    Trainee: .5,
    Junior: .85
}

//Obtengo el botòn de resumen
const btnResumen = document.querySelector("#btn-resumen");

//Creo la acción a realizar con el botón de "Resumen"
const imprimirPrecioo = document.getElementById("imprimirPrecio");

const calcularPrecio = (e) => {
    e.preventDefault();
    //Selecciono el valor del select  "Estudiante", "Trainee" o "Junior"
    let tipoTicket = document.getElementById("select").value;
    //Obtengo la cantidad de boletos que se quiere comprar
    let cantidad = document.getElementById("cant").value;
    let valor;

    try {
        valor = (valorTicket * cantidad) * boletos[tipoTicket]
    } catch (error) {
        alert("Tipo de ticket no válido");
    }

    imprimirPrecioo.innerHTML = valor;
}

btnResumen.addEventListener('click', calcularPrecio);