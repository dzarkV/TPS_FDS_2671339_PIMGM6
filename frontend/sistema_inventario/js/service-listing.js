function buscarUsuario() {
  var url =
    "https://sistema-mgm-service-users.azurewebsites.net/api/usuario/name?value=";

  const jwtToken = getTokenFromLocalStorage();
  // const jwtToken = localStorage.getItem('jwt');
  // Consumir el endpoint o la url de java
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
    // for (var i = 0; i < data.length; i++) {
    body = `<tr><td>${data.nombre_usuario}</td><td>${data.apellido_usuario}</td><td>${data.fecha_registro}</td></tr>`;
    // }
    document.getElementById("data").innerHTML = body;
    //console.log(body)
  };
}

function listarUsuarios() {
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
    for (var i = 0; i < data.length; i++) {
      body += `<tr><td>${data[i].nombre_usuario}</td><td>${data[i].apellido_usuario}</td><td>${data[i].fecha_registro}</td></tr>`;
    }
    document.getElementById("data").innerHTML = body;
  };
}

function getTokenFromLocalStorage() {
  return localStorage.getItem("jwt");
}

function crearUsuario() {
  // Capturar los datos del formulario
  var valorNombre = document.forms["crearUsuarioForm"]["nombre"].value;
  var valorApellido = document.forms["crearUsuarioForm"]["apellido"].value;
  var valorPassword = document.forms["crearUsuarioForm"]["pass"].value;
  var checkPassword = document.forms["crearUsuarioForm"]["confirnpass"].value;
  var username = document.querySelector("#username").innerHTML;
  var valorRol = document.forms["crearUsuarioForm"]["rol"].value;

  // Validar campos de contraseña
  if (valorPassword !== checkPassword) {
    alert("Las contraseñas no coinciden");
  } else {
    // Si las contraseñas coinciden, se procede a verificar con el username en la API si el usuario ya existe
    url =
      "https://sistema-mgm-service-users.azurewebsites.net/api/usuario/username?value=";
    const jwtToken = getTokenFromLocalStorage();

    fetch(url + username, {
      method: "GET",
      headers: {
        Authorization: `Bearer ${jwtToken}`,
      },
    })
      .then(async (response) => {
        const busquedaUsername = await response.json();
        // Arreglo de código de respuesta, porque siempre bota 200, por lo que se valida con la llave code del json
        if (busquedaUsername.code === 404) {
          url =
            "https://sistema-mgm-service-users.azurewebsites.net/api/usuario";
            // Se procede a crear el usuario
          fetch(url, {
            method: "POST",
            headers: {
              "Content-Type": "application/json",
              Authorization: `Bearer ${jwtToken}`,
            },
            body: JSON.stringify({
              nombre_usuario: valorNombre,
              apellido_usuario: valorApellido,
              rol_usuario: {
                id_rol: 102,
                nombre_rol: valorRol,
              },
              credenciales: {
                usuario: username,
                contrasena: valorPassword,
              }
            })
          })
            .then((response) => {
              // Si el usuario se crea exitosamente, se muestra el mensaje y se recarga la página
              if (response.status === 200) {
                alert(`Usuario ${username} creado exitosamente`);
                location.reload();
              } else {
                alert("Error al crear el usuario");
              }
            })
            .catch((error) => console.log(error));
        } else {
          // Si el usuario ya existe, se muestra un mensaje de alerta
          alert("El usuario ya existe");
        }
      })
      .catch((error) => console.log(error));
  }
}

function crearUsername() {
  var nombre = document.getElementsByName("nombre")[0].value.trim();
  var apellido = document.getElementsByName("apellido")[0].value.trim();
  
  document.getElementById("username").innerHTML =
    nombre.toLowerCase() + apellido.slice(0, 3).toLowerCase();
}
