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

function agregarGasto() {

    // Capturar informacion
    var valorTipoGasto = document.forms["crearGastoForm"]["tipoGasto"].value;
    var valorValorGasto = document.forms["crearGastoForm"]["valorGasto"].value;
  
     var url = "https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/gastos/guardar";
  
  
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
  }
  
