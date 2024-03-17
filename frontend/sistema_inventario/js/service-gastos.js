function listarGastos() {

     var url = "https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/gastos/listado";
   
   
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
         body += `<tr><td>${data[i].idGasto}</td><td>${data[i].tipoGasto}</td><td>${data[i].valorGasto}</td></tr>`
       }
       document.getElementById('data').innerHTML = body
       //console.log(body)
     }
   };

function buscarGasto() {
    var id = document.forms["gastos-form"]["busquedaID"].value;

    var url = "https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/gastos/listado";
    //  var url = "http://localhost:8080/api/gastos/listado";


    url = url + "/" + id;

    console.log(url);
    // Consumir el endpoint o la url de java
    fetch(url)
         .then(response => response.json())
         .then(datos => mostrarData(datos))
         .catch(error => console.log(error))
         console.log("holafech",data)


    // Metodo que pinta los datos
    const mostrarData = (data) => {
         let body = "";
         
         if (Array.isArray(data)) {
             // Caso en que se recibe un array de gastos
             for (let i = 0; i < data.length; i++) {
              body += `<tr><td>${data[i].idGasto}</td><td>${data[i].tipoGasto}</td><td>${data[i].valorGasto}</td></tr>`
         }
         } else {
             // Caso en que se recibe un solo proveedor (objeto)
             body += `<tr><td>${data.idGasto}</td><td>${data.tipoGasto}</td><td>${data.valorGasto}</td></tr>`
         }
     
         document.getElementById('data').innerHTML = body;
     }
     
}

function agregarGasto() {

    // Capturar informacion
    var valorTipoGasto = document.forms["crearGastoForm"]["tipoGasto"].value;
    var valorValorGasto = document.forms["crearGastoForm"]["valorGasto"].value;
  
     var url = "https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/gastos/guardar";
    //  var url = "http://localhost:8080/api/gastos/guardar";

  
  
    // Datos que enviarás en el cuerpo de la solicitud
    const dataVenta ={
      tipoGasto: valorTipoGasto,
      valorGasto: valorValorGasto,
    }
  
    console.log("data a enviar",dataVenta)
  
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
        alert('Se ha guardado el gasto: ' + data.idGasto);
      })
      .catch(error => {
        alert('Hubo un error: ' + error.message);
      });

      document.getElementById("guardarBoton").addEventListener("click", function() {
        // Redireccionar al home
        window.location.href = "Gastos.html";
      });

  }
  
