
function navegar() {
    var select = document.querySelector("#funcionUsuario");
    
    switch (select.value) {
        case '1':
            window.open("login.html", "_self");
            break;
        case '2':
            window.open("login.html", "_self");
            break;
        case '3':
            window.open("login.html", "_self");
            break;
        case '4':
            window.open("estados_de_usuarios.html", "_self");
            break;
        case '5':
            window.open("eliminar_usuario.html", "_self");
            break;
        case '6':
            window.open("crear_usuario.html", "_self");
            break;
        default:
            console.log('el valor es :' + select.value);
        }
}

const entry_endpoint = "https://sistema-mgm-service-users.azurewebsites.net/"
const span_message = document.getElementById("login_message")

fetch(entry_endpoint + "/api/login", {
    method: 'GET',
    headers: {
    'Content-Type': 'application/json'
    }
})
.then((response) => response.json())
.then((response) => span_message.innerText = response.detail)
.catch(function(error) {console.log(error)
});

