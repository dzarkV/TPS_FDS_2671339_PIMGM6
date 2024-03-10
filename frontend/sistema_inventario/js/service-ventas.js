function listarVentas() {

     // var url = "https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/productos/listado";
     var url = "http://localhost:8050/api/ventas/listado";
   
   
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
         body += `<tr><td>${data[i].idVenta}</td><td>${data[i].idStock}</td><td>${data[i].fechaVenta}</td><td>${data[i].cantidadItemsVentaXProducto}</td><td>${data[i].valorTotalVenta}</td></tr>`
       }
       document.getElementById('data').innerHTML = body
       //console.log(body)
     }
   };

   function buscarVenta() {
     var id = document.forms["ventas-form"]["busquedaID"].value;

     // var url = "https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/proveedores/listado";
     var url = "http://localhost:8050/api/ventas/listado";

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
              // Caso en que se recibe un array de proveedores
              for (let i = 0; i < data.length; i++) {
               body += `<tr><td>${data[i].idVenta}</td><td>${data[i].idStock}</td><td>${data[i].fechaVenta}</td><td>${data[i].cantidadItemsVentaXProducto}</td><td>${data[i].valorTotalVenta}</td></tr>`
          }
          } else {
              // Caso en que se recibe un solo proveedor (objeto)
              body += `<tr><td>${data.idVenta}</td><td>${data.idStock}</td><td>${data.fechaVenta}</td><td>${data.cantidadItemsVentaXProducto}</td><td>${data.valorTotalVenta}</td></tr>`
          }
      
          document.getElementById('data').innerHTML = body;
      }
      
}


function agregarVenta() {
     // Capturar informacion
     var valorCategoria = document.forms["crearProductoForm"]["categoria"].value;
     var valorNombre = document.forms["crearProductoForm"]["producto"].value;
     var valorPrecio = document.forms["crearProductoForm"]["precio"].value;
     var valorDescripcion = document.forms["crearProductoForm"]["descripciónDelProducto"].value;
   
     // var url = "https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/productos/guardar";
     var url = "http://localhost:8050/api/productos/guardar";
   
   
     // Datos que enviarás en el cuerpo de la solicitud
     const dataProducto ={
       idCategoria: {
         idCategoria: valorCategoria,
       },
       nombreProducto: valorNombre,
       precioProducto: valorPrecio,
       descripcionProducto: valorDescripcion
     }
   
     console.log("data a enviar",dataProducto)
   
     // Opciones para la solicitud POST
     const optionsConsumo = {
       method: 'POST',
       headers: {
         'Content-Type': 'application/json', // Indicar que los datos se enviarán en formato JSON
       },
       body: JSON.stringify(dataProducto), // Convertir los datos a formato JSON y agregarlos al cuerpo de la solicitud
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
         alert('Se ha guardado el producto ' + data.nombreProducto + ' con el ID: ' + data.idProducto);
       })
       .catch(error => {
         alert('Hubo un error: ' + error.message);
       });
   }
   
