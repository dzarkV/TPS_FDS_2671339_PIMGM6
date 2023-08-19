
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
  } else if (valorNombre === "" || valorApellido === "") {
    alert("Debe llenar todos los campos");
  } else if (valorPassword.length < 8) {
    alert("La contraseña debe tener al menos 8 caracteres");
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
      .then((resSearchUsername) => {
        // const busquedaUsername = await resSearchUsername.json();
        // Si la respuesta es 404 (no existe el usuario), se procede a crearlo
        if (resSearchUsername.status === 404) {
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
                nombre_rol: valorRol
              },
              credenciales: {
                usuario: username,
                contrasena: valorPassword
              }
            }),
          })
            .then((responseCreateUser) => {
              // Si el usuario se crea exitosamente, se muestra el mensaje y se recarga la página
              if (responseCreateUser.status === 200) {
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

function ActualizarUsuario() {
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
    } else if (valorNombre === "" || valorApellido === "") {
      alert("Debe llenar todos los campos");
    } else if (valorPassword.length < 8) {
      alert("La contraseña debe tener al menos 8 caracteres");
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
        .then((resSearchUsername) => {
          // const busquedaUsername = await resSearchUsername.json();
          // Si la respuesta es 404 (no existe el usuario), se procede a crearlo
          if (resSearchUsername.status === 404) {
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
                  nombre_rol: valorRol
                },
                credenciales: {
                  usuario: username,
                  contrasena: valorPassword
                }
              }),
            })
              .then((responseCreateUser) => {
                // Si el usuario se crea exitosamente, se muestra el mensaje y se recarga la página
                if (responseCreateUser.status === 200) {
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
