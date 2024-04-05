function navegar() {
  var select = document.querySelector("#funcionUsuario");

  switch (select.value) {
    case "1":
      window.open("Actualizar_Usuario.html", "_self");
      break;
    case "2":
      window.open("consultar_usuario.html", "_self");
      break;
    case "3":
      window.open("estados_de_usuarios.html", "_self");
      break;
    case "4":
      window.open("eliminar_usuario.html", "_self");
      break;
    case "5":
      window.open("crear_usuario.html", "_self");
      break;
    default:
      console.log("el valor es :" + select.value);
  }
}

function logout() {
  window.localStorage.removeItem("jwt");
  window.localStorage.removeItem("userSession");
  window.location.href = "login.html";
}

async function verificarUsuarioSesion(jwt) {
  const entry_endpoint = "https://sistema-mgm-service-users.azurewebsites.net";

  if (jwt) {
    await fetch(entry_endpoint + "/api/me", {
      method: "GET",
      headers: {
        Authorization: `Bearer ${jwt}`,
      },
    })
      .then((response) => response.json())
      .then((data) =>
        window.localStorage.setItem("userSession", JSON.stringify(data))
      );
  } else {
    window.location.href = "login.html";
  }
}

// Loguearse por boton ingresar o tecla enter
document.addEventListener("DOMContentLoaded", function() {

  if (location.pathname.endsWith("login.html") == true) {
  const formulario = document.getElementById("login-form");
  const cargando = document.getElementById("cargando");

  formulario.addEventListener("submit", async function(event) {
    cargando.style.display = "block";
    // Limpiar mensaje span de mensajes de error
    var mensajeError = document.getElementById('login_message');
    mensajeError.style.display = "none";
  
    event.preventDefault();
    await loginUsuario(event); 

    cargando.style.display = "none";
  });

  formulario.addEventListener("keydown", async function(event) {
    if (event.key === "Enter") {
      cargando.style.display = "block";

      event.preventDefault();
      await loginUsuario(event); 

      cargando.style.display = "none";
    }
  });
}
});

async function loginUsuario(event) { // Recibir event como argumento

  event.preventDefault();

  var inputUser = document.getElementById('user').value.trim();
  var inputPass = document.getElementById('pass').value.trim();
  // var error = document.getElementById('login_message');
  const span_message = document.getElementById("login_message");

  if (inputUser === '' || inputPass === '') {
    span_message.style.display = "block";
    span_message.innerText = "El usuario y contraseña son obligatorios";
    return;
  }

  const entry_endpoint = "https://sistema-mgm-service-users.azurewebsites.net";
  const form = document.querySelector("#login-form");

  // detener el comportamiento predeterminado del formulario (que es recargar la página)
  event.preventDefault();

  // obtener los datos del formulario como un objeto FormData
  const formData = new FormData(form);

  // enviar los datos al servidor usando fetch()
  const responseAuth = await fetch(entry_endpoint + "/api/login", {
    method: "POST",
    body: formData,
  });

  // procesar la respuesta del servidor
  const dataAuth = await responseAuth.json();

  
  // si el usuario está autenticado con token, guardar en localStorage y redirigir al usuario a la página de inicio
  if (dataAuth.access_token) {
    // guardar el token en el almacenamiento local
    window.localStorage.setItem("jwt", dataAuth.access_token);

    // verificar si el usuario está autenticado y obtener datos
    verificarUsuarioSesion(dataAuth.access_token).then(
      () => {
        // redirigir al usuario a la página de inicio
        window.location.href = "index.html";
      },
      (error) => {
        console.log(error);
      }
    );
  } else {
    // si el inicio de sesión falló, mostrar un mensaje de error
    span_message.style.display = "block";
    span_message.innerText = dataAuth.detail;
  }
}


window.addEventListener("DOMContentLoaded", function () {
  // obtener datos de usuario en sesion
  if (location.pathname.endsWith("login.html") == false) {
    const nombreUsuario = document.getElementById("nombreUsuario");
    const rolUsuario = document.getElementById("rolUsuario");
    const usuarioSesion = localStorage.getItem("userSession");

    // verificar si el usuario está autenticado
    if (usuarioSesion == null) {
      // si no está autenticado, redirigir al usuario a la página de inicio de sesión
      window.location.href = "login.html";
    } else {
      // si el usuario está autenticado, mostrar su nombre y rol en la barra de navegación
      nombreUsuario.innerHTML = JSON.parse(usuarioSesion).nombre_usuario;
      rolUsuario.innerHTML = JSON.parse(usuarioSesion).rol_usuario.nombre_rol;

      // deshabilitar opciones de menu para vendedores
      if (JSON.parse(usuarioSesion).rol_usuario.nombre_rol == "Vendedor") {
        const selectFuncionUsuario = document.getElementById("funcionUsuario");
        selectFuncionUsuario.remove();
      }
    }

    if (location.pathname.endsWith("Actualizar_Usuario.html")) {
      // carga datos del usuario sesion en el formulario
      document.getElementsByName("nombre")[0].value = JSON.parse(
        localStorage.getItem("userSession")
      ).nombre_usuario;
      document.getElementsByName("apellido")[0].value = JSON.parse(
        localStorage.getItem("userSession")
      ).apellido_usuario;
      document.getElementById("username").innerHTML = JSON.parse(
        localStorage.getItem("userSession")
      ).credenciales.usuario;
      document.getElementsByName("rol")[0].value = JSON.parse(
        localStorage.getItem("userSession")
      ).rol_usuario.nombre_rol;
    }
  }
});


