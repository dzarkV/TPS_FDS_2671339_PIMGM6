function buscarProducto() {
  var nombre = document.forms["producto-form"]["busquedaProducto"].value;
  var id = document.forms["producto-form"]["busquedaID"].value;

  var url = "http://localhost:8091/api/productos/buscar";
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


function buscarProveedor() {

  var url = "http://localhost:8080/api/proveedor/buscar";


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
        body+=`<tr><td>${data[i].NombreDeEmpresa}</td><td>${data[i].direccion}</td><td>${data[i].telefono}</td><td>${data[i].descripcion}</td></tr>`
    }
    document.getElementById('data').innerHTML = body
    //console.log(body)
  }
}

function buscarUsuario() {

  var url = "https://sistema-mgm-service-users.azurewebsites.net/api/usuario/name?value=";

  const jwtToken = getTokenFromLocalStorage();
  // const jwtToken = localStorage.getItem('jwt');
  // Consumir el endpoint o la url de java
  fetch(url + document.forms["usuario-form"]["busquedaUsuario"].value, {
    headers: {
      Authorization: `Bearer ${jwtToken}`
    }
  })
    .then(response => response.json())  
    .then(datos => mostrarData(datos.data[0]))
    .catch( error => console.log(error) )


  // Metodo que pinta los datos
  const mostrarData = (data) => {
    console.log(data)
    let body = "";
    // for (var i = 0; i < data.length; i++) {      
        body=`<tr><td>${data.nombre_usuario}</td><td>${data.apellido_usuario}</td><td>${data.fecha_registro}</td></tr>`
    // }
    document.getElementById('data').innerHTML = body
    //console.log(body)
  }
}

function listarUsuarios() {
  var url = "https://sistema-mgm-service-users.azurewebsites.net/api/usuarios";

  const jwtToken = getTokenFromLocalStorage();

  fetch(url, {
    headers: {
      Authorization: `Bearer ${jwtToken}`
    }
  })
    .then(response => response.json())  
    .then(datos => mostrarData(datos.data[0]))
    .catch( error => console.log(error) )

  // Metodo que pinta los datos
  const mostrarData = (data) => {
    console.log(data)
    let body = ""
    for (var i = 0; i < data.length; i++) {      
        body+=`<tr><td>${data[i].nombre_usuario}</td><td>${data[i].apellido_usuario}</td><td>${data[i].fecha_registro}</td></tr>`
    }
    document.getElementById('data').innerHTML = body
  }
}

function getTokenFromLocalStorage() {
  return localStorage.getItem('jwt')
}

