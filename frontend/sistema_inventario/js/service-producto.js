function buscarProducto() {
  var nombre = document.forms["producto-form"]["busquedaProducto"].value;
  var id = document.forms["producto-form"]["busquedaID"].value;

  var url = "http://localhost:8080/api/productos/buscar";
  if(nombre !== '' && id !== ''){
    url = url + "?idProducto="+id+"&nombreProducto="+nombre;
  }
  if(nombre !== '' && id === ''){
    url = url + "?nombreProducto="+nombre;
  }
  if(nombre === '' && id !== ''){
    url = url + "?idProducto="+id;
  }

  // Consumir el endpoint o la url de java
  fetch(url)
    .then(response => response.json())
    .then(datos => mostrarData(datos))
    .catch( error => console.log(error) )


  // Metodo que pinta los datos
  const mostrarData = (data) => {
    console.log(data)
    let body = ""
    for (var i = 0; i < data.length; i++) {      
        body+=`<tr><td>${data[i].idProducto}</td><td>${data[i].nombreProducto}</td><td>${data[i].precioProducto}</td><td>${data[i].marca}</td></tr>`
    }
    document.getElementById('data').innerHTML = body
    //console.log(body)
  }
}


function listarProveedor() {

  var url = "http://localhost:8080/api/proveedores/listado";


  // Consumir el endpoint o la url de java
  fetch(url)
    .then(response => response.json())
    .then(datos => mostrarData(datos))
    .catch( error => console.log(error) )


  // Metodo que pinta los datos
  const mostrarData = (data) => {
    console.log(data)
    let body = ""
    for (var i = 0; i < data.length; i++) {      
        body+=`<tr><td>${data[i].idProveedor}</td><td>${data[i].nombreProveedor}</td><td>${data[i].direccionProveedor}</td><td>${data[i].telefonoProveedor}</td><td>${data[i].descripcionProveedor}</td><td>${data[i].empresa}</td><td>${data[i].emailProveedor}</td></tr>`
    }
    document.getElementById('data').innerHTML = body
    //console.log(body)
  }
}

function buscarusuario() {

  var url = "http://localhost:8080/api/usuario/buscar";


  // Consumir el endpoint o la url de java
  fetch(url)
    .then(response => response.json())
    .then(datos => mostrarData(datos))
    .catch( error => console.log(error) )


  // Metodo que pinta los datos
  const mostrarData = (data) => {
    console.log(data)
    let body = ""
    for (var i = 0; i < data.length; i++) {      
        body+=`<tr><td>${data[i].NombreUsuario}</td><td>${data[i].telefono}</td><td>${data[i].correo}</td></tr>`
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
  
  var url = "http://localhost:8080/api/productos/guardar";

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
    alert('Se a guardado el producto '+ data.nombreProducto + ' con el ID: '+ data.idProducto);
  }).catch(error => {
    alert('Hubo un error:', error);
  });

}

function registrarProveedor() {
  // Capturar informacion
  var valorNombre = document.forms["crearProveedoresForm"]["nombreVendedor"].value;
  var valorDireccion = document.forms["crearProveedoresForm"]["dirección"].value;
  var valorTelefono = document.forms["crearProveedoresForm"]["telefono"].value;
  var valorDescripcion = document.forms["crearProveedoresForm"]["descripción"].value;
  var valorEmpresa = document.forms["crearProveedoresForm"]["empresa"].value;
  var valorEmail = document.forms["crearProveedoresForm"]["email"].value;
  
  var url = "http://localhost:8080/api/proveedores/registar";

  // Datos que enviarás en el cuerpo de la solicitud

  const dataProducto ={
    direccionProveedor: valorDireccion,
    nombreProveedor: valorNombre,
    telefonoProveedor: valorTelefono,
    descripcionProveedor: valorDescripcion,
    empresa: valorEmpresa,
    emailProveedor: valorEmail,
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
    alert('se ha creado el proveedor ');
    location.reload();
  }).catch(error => {
    alert('Hubo un error:', error);
  });

}