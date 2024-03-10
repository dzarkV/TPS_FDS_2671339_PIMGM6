function listarProductos() {

  var url = "https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/productos/listado";


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
      body += `<tr><td>${data[i].idProducto}</td><td>${data[i].nombreProducto}</td><td>${data[i].precioProducto}</td><td>${data[i].descripcionProducto}</td></tr>`
    }
    document.getElementById('data').innerHTML = body
    //console.log(body)
  }
}


function buscarProducto() {
  var nombre = document.forms["producto-form"]["busquedaProducto"].value;
  var id = document.forms["producto-form"]["busquedaID"].value;

  var url = "https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/productos/buscar";
  if (nombre !== '' && id !== '') {
    url = url + "?idProducto=" + id + "&nombreProducto=" + nombre;
  }
  if (nombre !== '' && id === '') {
    url = url + "?nombreProducto=" + nombre;
  }
  if (nombre === '' && id !== '') {
    url = url + "?idProducto=" + id;
  }

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
      body += `<tr><td>${data[i].idProducto}</td><td>${data[i].nombreProducto}</td><td>${data[i].precioProducto}</td><td>${data[i].marca}</td></tr>`
    }
    document.getElementById('data').innerHTML = body
    //console.log(body)
  }
}

function crearProducto() {
  // Capturar informacion
  var valorNombre = document.forms["crearProductoForm"]["producto"].value;
  var valorCategoria = document.forms["crearProductoForm"]["categoria"].value;
  var valorPrecio = document.forms["crearProductoForm"]["precio"].value;
  var valorDescripcion = document.forms["crearProductoForm"]["descripciónDelProducto"].value;

  var url = "https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/productos/guardar";
  // Datos que enviarás en el cuerpo de la solicitud

  const dataProducto = {
    idCategoria: {
      idCategoria: valorCategoria
    },
    nombreProducto: valorNombre,
    precioProducto: valorPrecio,
    descripcionProducto: valorDescripcion,
  };

  // Opciones para la solicitud POST
  const optionsConsumo = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json', // Indicar que los datos se enviarán en formato JSON
    },
    body: JSON.stringify(dataProducto), // Convertir los datos a formato JSON y agregarlos al cuerpo de la solicitud
  };

  // Consumir el endpoint o la url de java
  // Realizar la solicitud POST utilizando fetch
  fetch(url, optionsConsumo)
    .then(response => response.json()) // Analizar la respuesta JSON
    .then(data => {
      alert('Se a guardado el producto ' + data.nombreProducto + ' con el ID: ' + data.idProducto);
    }).catch(error => {
      alert('Hubo un error:', error);
    });

}

