function listarVentas() {

  var url = "https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/ventas/listado";
  //  var url = "http://localhost:8050/api/ventas/listado";


  // Consumir el endpoint o la url de java
  fetch(url)
    .then(response => response.json())
    .then(datos => mostrarData(datos))
    .catch(error => console.log(error))


  // Metodo que pinta los datos
  const mostrarData = (data) => {
    console.log(data)
    let body = ""
    for (var i = 0; i < data.length; i++) {
      body += `<tr><td>${data[i].idVenta}</td><td>${data[i].fechaVenta}</td><td>${data[i].cantidadItemsVentaXProducto}</td><td>${data[i].valorTotalVenta}</td></tr>`
    }
    document.getElementById('data').innerHTML = body
    //console.log(body)
  }
};

function buscarVenta() {
  var id = document.forms["ventas-form"]["busquedaID"].value;

  var url = "https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/ventas/listado";

  url = url + "/" + id;

  console.log(url);
  // Consumir el endpoint o la url de java
  fetch(url)
    .then(response => response.json())
    .then(datos => mostrarData(datos))
    .catch(error => console.log(error))
  console.log("holafech", data)


  // Metodo que pinta los datos
  const mostrarData = (data) => {
    let body = "";

    if (Array.isArray(data)) {
      // Caso en que se recibe un array de proveedores
      for (let i = 0; i < data.length; i++) {
        body += `<tr><td>${data[i].idVenta}</td><td>${data[i].idStock}</td><td>${data[i].fechaVenta}</td><td>${data[i].cantidadItemsVentaXProducto}</td><td>${data[i].valorTotalVenta}</td></tr>`
      }
    } else {
      // Caso en que se recibe un solo proveedor (objeto)
      body += `<tr><td>${data.idVenta}</td><td>${data.idStock}</td><td>${data.fechaVenta}</td><td>${data.cantidadItemsVentaXProducto}</td><td>${data.valorTotalVenta}</td></tr>`
    }

    document.getElementById('data').innerHTML = body;
  }

}


function agregarVenta() {
  // Capturar informacion
  var valorIdStock = document.forms["crearVentasForm"]["idStock"].value;
  var valorFechaVenta = document.forms["crearVentasForm"]["fechaVenta"].value;
  var valorCantidadItems = document.forms["crearVentasForm"]["cantidadItems"].value;
  var valorValorTotal = document.forms["crearVentasForm"]["valorTotal"].value;

  var url = "https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/ventas/guardar";


  // Datos que enviarás en el cuerpo de la solicitud
  const dataVenta = {
    idStock: valorIdStock,
    fechaVenta: valorFechaVenta,
    cantidadItemsVentaXProducto: valorCantidadItems,
    valorTotalVenta: valorValorTotal,
  }

  console.log("data a enviar", dataVenta)

  // Opciones para la solicitud POST
  const optionsConsumo = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json', // Indicar que los datos se enviarán en formato JSON
    },
    body: JSON.stringify(dataVenta), // Convertir los datos a formato JSON y agregarlos al cuerpo de la solicitud
  };
  console.log("hola consola", optionsConsumo);

  // Consumir el endpoint o la url de java
  // Realizar la solicitud POST utilizando fetch
  fetch(url, optionsConsumo)
    .then(response => {
      if (!response.ok) {
        throw new Error('Error en la solicitud: ' + response.statusText);
        console.log(response.status)
      }
      return response.json();
    })
    .then(data => {
      alert('Se ha guardado la venta : ' + data.idVenta);
    })
    .catch(error => {
      alert('Hubo un error: ' + error.message);
    });
}

function getTotalVentasDia() {
  var fecha = document.getElementById("fechaDia").value;
  var url = "https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/ventas/total/dia?fecha=" + fecha;
  fetch(url)
    .then(response => response.json())
    .then(data => {
      document.getElementById("resultadoDia").innerHTML = "Total de ventas para el día: " + data;
    });
}

function getTotalVentasSemana() {
  var fecha = document.getElementById("fechaSemana").value;
  var url = "https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/ventas/total/semana?fecha=" + fecha;
  fetch(url)
    .then(response => response.json())
    .then(data => {
      document.getElementById("resultadoSemana").innerHTML = "Total de ventas para la semana: " + data;
    });
}

function getTotalVentasMes() {
  console.log("hola desde total ventas del mes")
  var fecha = document.getElementById("fechaMes").value;
  var url = "https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/ventas/total/mes?fecha=" + fecha;
  fetch(url)
    .then(response => response.json())
    .then(data => {
      document.getElementById("resultadoMes").innerHTML = "Total de ventas para el mes: " + data;
    });
}
