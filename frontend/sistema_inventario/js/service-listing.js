function buscarUsuario() {
  // Consumir el endpoint usuario service para buscar un usuario por nombre
  var url =
    "https://sistema-mgm-service-users.azurewebsites.net/api/usuario/name?value=";

  const jwtToken = getTokenFromLocalStorage();
  // Consultar API pasando el nombre buscado con token
  fetch(url + document.forms["usuario-form"]["busquedaUsuario"].value, {
    headers: {
      Authorization: `Bearer ${jwtToken}`,
    },
  })
    .then((response) => response.json())
    .then((datos) => mostrarData(datos.data[0]))
    .catch((error) => console.log(error));

  // Metodo que pinta los datos
  const mostrarData = (data) => {
    let body = "";
    body = `<tr><td>${data.nombre_usuario}</td><td>${data.apellido_usuario}</td><td>${data.fecha_registro}</td></tr>`;
    document.getElementById("data").innerHTML = body;
  };
}

function listarUsuarios() {
  // Consumir el endpoint usuario service para listar todos los usuarios
  var url = "https://sistema-mgm-service-users.azurewebsites.net/api/usuarios";

  const jwtToken = getTokenFromLocalStorage();

  fetch(url, {
    headers: {
      Authorization: `Bearer ${jwtToken}`,
    },
  })
    .then((response) => response.json())
    .then((datos) => mostrarData(datos.data[0]))
    .catch((error) => console.log(error));

  // Metodo que pinta los datos
  const mostrarData = (data) => {
    let body = "";
    // Si la pagina actual es consultar_usuario.html
    if(location.pathname.endsWith("consultar_usuario.html")== true){
      // Datos de usuario en la tabla 
      for (var i = 0; i < data.length; i++) {
        body += `<tr><td>${data[i].nombre_usuario}</td><td>${data[i].apellido_usuario}</td><td>${data[i].fecha_registro}</td><td>${data[i].credenciales.usuario}</td></tr>`;
      }
      document.getElementById("data").innerHTML = body;
    }
    // Si la pagina actual es estados_de_usuarios.html
    else if(location.pathname.endsWith("estados_de_usuarios.html")== true){
      // Datos de usuario en la tabla
      for (var i = 0; i < data.length; i++) {
        body += `<tr><td>${data[i].nombre_usuario}</td><td>${data[i].apellido_usuario}</td><td>${data[i].rol_usuario.nombre_rol}</td>`;
        if(data[i].credenciales.estado == true){
          // Tambien se agrega un boton para cambiar el estado del usuario
          body += `<td><a class="estilo-intro-icon icon-user" style="color:green;"></a></td><td><button id="btn-state" class="btn btn-primary" style="background-color: red;" onclick="cambiarEstadoUsuario()">Deshabilitar</button></td></tr>`;
        } else {
          body += `<td><a class="estilo-intro-icon icon-user" style="color:red;"></a></td><td><button id="btn-state" class="btn btn-primary" style="background-color: #52d3aa;" onclick="cambiarEstadoUsuario()">Habilitar</button></td></tr>`;
        }
      }
      document.getElementById("data-users").innerHTML = body;
    }
  };
}

function cambiarEstadoUsuario() {
  // Consumir el endpoint usuario service para buscar un usuario por nombre y obtener id
  var urlBuscar = "https://sistema-mgm-service-users.azurewebsites.net/api/usuario/name?value=";
  const jwtToken = getTokenFromLocalStorage();
  const idUsuario = '';

  let nombreUsuario = '';
  let row = document.querySelector(this.button).closest("tr");
  nombreUsuario = row.querySelector("td:first-child").textContent;
  console.log(nombreUsuario);

  // Consultar API pasando el nombre buscado
  fetch(urlBuscar + nombreUsuario, {
    method: "GET",
    headers: {
      Authorization: `Bearer ${jwtToken}`,
    },
  })
    .then((response) => response.json())
    .then((datos) => idUsuario = datos.data[0].id_usuario)
    .then((idUsuario) => console.log(idUsuario))
    .catch((error) => console.log(error));
  
  // var urlActualizar = "https://sistema-mgm-service-users.azurewebsites.net/api/usuario/";
  // // Consultar API pasando el nombre buscado con token
  // fetch(urlActualizar + idUsuario, {
  //   method: "PUT",
  //   headers: {
  //     Authorization: `Bearer ${jwtToken}`,
  //   },
  // })
  //   .then((response) => response.json())
  //   .then((datos) => console.log(datos))
  //   .catch((error) => console.log(error));
}

function getTokenFromLocalStorage() {
  return localStorage.getItem("jwt");
}

function crearUsername() {
  var nombre = document.getElementsByName("nombre")[0].value.trim();
  var apellido = document.getElementsByName("apellido")[0].value.trim();

  document.getElementById("username").innerHTML =
    nombre.toLowerCase() + apellido.slice(0, 3).toLowerCase();
}
