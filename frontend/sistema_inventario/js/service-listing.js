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
    body = `<tr><td>${data.nombre_usuario}</td><td>${data.apellido_usuario}</td><td>${data.fecha_registro}</td><td>${data.credenciales.usuario}</td></tr>`;
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
      // Añadir datos de usuario en la tabla 
      for (var i = 0; i < data.length; i++) {
        body += `<tr><td>${data[i].nombre_usuario}</td><td>${data[i].apellido_usuario}</td><td>${data[i].fecha_registro}</td><td>${data[i].credenciales.usuario}</td></tr>`;
      }
      document.getElementById("data").innerHTML = body;
    }
    // Si la pagina actual es estados_de_usuarios.html
    else if(location.pathname.endsWith("estados_de_usuarios.html")== true){
      // Añdir datos de usuario en el body de la tabla
      for (var i = 0; i < data.length; i++) {
        body += `<tr data-id="${data[i].id_usuario}" data-nombre="${data[i].nombre_usuario}" data-user=${data[i].credenciales.usuario}><td>${data[i].nombre_usuario}</td><td>${data[i].apellido_usuario}</td><td>${data[i].rol_usuario.nombre_rol}</td>`;
        if(data[i].credenciales.estado == true){
          // Tambien se agrega un boton para cambiar el estado del usuario
          body += `<td><a class="estilo-intro-icon icon-user" style="color:green;" title="Activo"></a></td><td><button id="btn-state" class="btn btn-primary" style="background-color: red;" onclick="cambiarEstadoUsuario()">Deshabilitar</button></td></tr>`;
        } else {
          body += `<td><a class="estilo-intro-icon icon-user" style="color:red;" title="No activo"></a></td><td><button id="btn-state" class="btn btn-primary" onclick="cambiarEstadoUsuario()">Habilitar</button></td></tr>`;
        }
      }
      document.getElementById("data-users").innerHTML = body;
    }
  };
}

function cambiarEstadoUsuario() {
  // Cambiar el estado del usuario
  
  // Obtener todos los botones de estado
  const botonesEstado = document.querySelectorAll("#btn-state");

  // Agregar un evento a cada boton
  botonesEstado.forEach(function(boton) {
    boton.addEventListener("click", function(event) {
      // Obtener los datos de la fila del boton seleccionado
      const accion = boton.textContent || boton.innerText || boton.innerHTML;
      const fila = event.target.closest('tr');
      const idUsuario = fila.getAttribute('data-id');
      const nombreUsuario = fila.getAttribute('data-user');
      // Llamar a la funcion para cambiar el estado del usuario
      actualizarEstadoUsuario(accion, idUsuario, nombreUsuario);
    });
  });
}

function actualizarEstadoUsuario(accion, id, usuario) {
  // Actualizar el estado del usuario
  const status = accion === "Habilitar" ? true : false;
  // Consumir el endpoint usuario service para buscar un usuario por nombre y obtener id
  var urlBuscar = "https://sistema-mgm-service-users.azurewebsites.net/api/usuario/username?value=";
  const jwtToken = getTokenFromLocalStorage();

  // Consultar API pasando el nombre buscado
  fetch(urlBuscar + usuario, {
    method: "GET",
    headers: {
      Authorization: `Bearer ${jwtToken}`,
    },
  })
    .then(async (response) => {
      const user = await response.json();
      // Se procede a actualizar el estado del usuario
      url = "https://sistema-mgm-service-users.azurewebsites.net/api/usuario/";
      fetch(url + id, {
        method: "PUT",
        headers: {
          accept: "application/json",
          "Content-Type": "application/json",
          Authorization: `Bearer ${jwtToken}`,
        },
        body: JSON.stringify({
          nombre_usuario: user.data[0].nombre_usuario,
          apellido_usuario: user.data[0].apellido_usuario,
          credenciales: {
            estado: status,
          },
        }),
      })
        .then((responseUpdatedStatus) => {
          if (responseUpdatedStatus.status === 200) {
            alert(`Usuario ${user.data[0].nombre_usuario} ${user.data[0].apellido_usuario} ${status ? "habilitado" : "deshabilitado"} exitosamente.`);
            location.reload();
          } else {
            alert("Error al actualizar el estado del usuario");
          }
        })
        .catch((error) => console.log(error));
    })
    .catch((error) => console.log(error));
  
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
