function listarVentas() {
  var url =
    "https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/ventas/listado";
  //  var url = "http://localhost:8050/api/ventas/listado";

  // Consumir el endpoint o la url de java
  fetch(url)
    .then((response) => response.json())
    .then((datos) => mostrarData(datos))
    .catch((error) => console.log(error));

  // Metodo que pinta los datos
  const mostrarData = (data) => {
    let body = "";
    for (var i = 0; i < data.length; i++) {
      body += `<tr><td>${data[i].idVenta}</td><td>${data[i].fechaVenta}</td><td>${data[i].cantidadItemsVentaXProducto}</td><td>${data[i].valorTotalVenta}</td></tr>`;
    }
    document.getElementById("data").innerHTML = body;
    //console.log(body)
  };
}

function buscarVenta() {
  var id = document.forms["ventas-form"]["busquedaID"].value;

  var url =
    "https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/ventas/listado";

  url = url + "/" + id;

  console.log(url);
  // Consumir el endpoint o la url de java
  fetch(url)
    .then((response) => response.json())
    .then((datos) => mostrarData(datos))
    .catch((error) => console.log(error));
  console.log("holafech", data);

  // Metodo que pinta los datos
  const mostrarData = (data) => {
    let body = "";

    if (Array.isArray(data)) {
      // Caso en que se recibe un array de proveedores
      for (let i = 0; i < data.length; i++) {
        body += `<tr><td>${data[i].idVenta}</td><td>${data[i].idStock}</td><td>${data[i].fechaVenta}</td><td>${data[i].cantidadItemsVentaXProducto}</td><td>${data[i].valorTotalVenta}</td></tr>`;
      }
    } else {
      // Caso en que se recibe un solo proveedor (objeto)
      body += `<tr><td>${data.idVenta}</td><td>${data.idStock}</td><td>${data.fechaVenta}</td><td>${data.cantidadItemsVentaXProducto}</td><td>${data.valorTotalVenta}</td></tr>`;
    }

    document.getElementById("data").innerHTML = body;
  };
}

function listarProductosEnSelect() {
  
  fetch("https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/stock/productosEnStockParaVenta")
    .then((response) => response.json())
    .then((data) => {
      const select = document.getElementById("productoVenta");
      data.forEach((producto) => {
        const option = document.createElement("option");
        option.value = producto.idEntrada;
        option.text = producto.nombreProducto;
        option.setAttribute("data-cantidad", producto.cantidadItemsEntrada);
        option.setAttribute("data-costoUnitario", producto.costoUnitario);
        select.appendChild(option);
      });
    })
    .catch((error) => console.error("Error:", error));
}

function agregarVenta() {
  // Capturar informacion
  var valorIdEntrada = document.forms["crearVentasForm"]["productoVenta"].value;
  var valorFechaVenta = document.forms["crearVentasForm"]["fechaVenta"].value;
  var valorCantidadItems =
    document.forms["crearVentasForm"]["cantidadItems"].value;
  var valorValorTotal = document.forms["crearVentasForm"]["valorTotal"].value;

  // Validar campos
  if (valorIdEntrada === "Seleccionar producto") {
    alert("Por favor seleccione un producto");
    return;
  }

  if (valorFechaVenta === "") {
    alert("Por favor seleccione una fecha");
    return;
  }

  // Obtener el option seleccionado
  var option = document.getElementById("productoVenta").options[document.getElementById("productoVenta").selectedIndex];

  // Validar valores minimos
  if (parseInt(valorCantidadItems) > parseInt(option.getAttribute("data-cantidad"))) {
    alert("La cantidad de items no puede ser mayor a " + option.getAttribute("data-cantidad"));
    return;
  }

  var url = "https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/ventas/guardar";

  // Datos que enviarás en el cuerpo de la solicitud
  const dataVenta = {
    idStock: null,
    fechaVenta: valorFechaVenta,
    cantidadItemsVentaXProducto: valorCantidadItems,
    valorTotalVenta: valorValorTotal,
  };

  console.log("data a enviar", dataVenta);

  // Opciones para la solicitud POST
  const optionsConsumo = {
    method: "POST",
    headers: {
      "Content-Type": "application/json", // Indicar que los datos se enviarán en formato JSON
    },
    body: JSON.stringify(dataVenta), // Convertir los datos a formato JSON y agregarlos al cuerpo de la solicitud
  };

  // Consumir el endpoint o la url de java
  // Realizar la solicitud POST utilizando fetch
  fetch(url + "?idEntrada=" + option.value, optionsConsumo)
    .then((response) => {
      if (!response.ok) {
        throw new Error("Error en la solicitud: " + response.statusText);
      }
      return response.json();
    })
    .then((data) => {
      alert("Se ha guardado la venta : " + data.idVenta);
      window.location.href = "ventas.html";
    })
    .catch((error) => {
      alert("Hubo un error: " + error.message);
    });
}

function getTotalVentasDia() {
  var fecha = document.getElementById("fechaDia").value;
  var url =
    "https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/ventas/total/dia?fecha=" +
    fecha;
  fetch(url)
    .then((response) => response.json())
    .then((data) => {
      document.getElementById("resultadoDia").innerHTML =
        "Total de ventas para el día: " + data;
    });
}

function getTotalVentasSemana() {
  var fecha = document.getElementById("fechaSemana").value;
  var url =
    "https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/ventas/total/semana?fecha=" +
    fecha;
  fetch(url)
    .then((response) => response.json())
    .then((data) => {
      document.getElementById("resultadoSemana").innerHTML =
        "Total de ventas para la semana: " + data;
    });
}

function getTotalVentasMes() {
  console.log("hola desde total ventas del mes");
  var fecha = document.getElementById("fechaMes").value;
  var url =
    "https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/ventas/total/mes?fecha=" +
    fecha;
  fetch(url)
    .then((response) => response.json())
    .then((data) => {
      document.getElementById("resultadoMes").innerHTML =
        "Total de ventas para el mes: " + data;
    });
}

function chartVentas() {
  var url =
    "https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/ventas/listado";

  // Consumir el endpoint o la url de java
  fetch(url)
    .then((response) => response.json())
    .then((datos) => mostrarData(datos))
    .catch((error) => console.log(error));

  // Metodo que pinta los datos
  const mostrarData = (data) => {
    // Crear chart de ventas si la pagina actual es reporte_ventas.html
    if (window.location.pathname.endsWith("reporte_ventas.html") == true) {
      // Crear chart de ventas por mes
      const ventasXmes = document.getElementById("ventasXmesChart");

      const ventasPorMes = data.reduce((acc, venta) => {
        const fecha = new Date(venta.fechaVenta);
        const mes = fecha.toLocaleString("default", { month: "long" });
        if (acc[mes]) {
          acc[mes] += venta.valorTotalVenta;
        } else {
          acc[mes] = venta.valorTotalVenta;
        }
        return acc;
      }, {});

      console.log(ventasPorMes);
      new Chart(ventasXmes, {
        type: "line",
        data: {
          labels: Object.keys(ventasPorMes),
          datasets: [
            {
              label: "Ventas",
              data: Object.values(ventasPorMes),
              borderColor: "rgba(255, 99, 132, 1)",
              borderWidth: 1,
            },
          ],
        },
        options: {
          scales: {
            y: {
              beginAtZero: true,
            },
          },
        },
      });

      // Crear chart de ventas por año
      const ventasXanio = document.getElementById("ventasXanioChart");

      const ventasPorAnio = data.reduce((acc, venta) => {
        const fecha = new Date(venta.fechaVenta);
        const anio = fecha.getFullYear();
        if (acc[anio]) {
          acc[anio] += venta.valorTotalVenta;
        } else {
          acc[anio] = venta.valorTotalVenta;
        }
        return acc;
      }, {});

      console.log(ventasPorAnio);

      new Chart(ventasXanio, {
        type: "bar",
        data: {
          labels: Object.keys(ventasPorAnio),
          datasets: [
            {
              label: "Ventas",
              data: Object.values(ventasPorAnio),
              borderColor: "rgba(255, 99, 132, 1)",
              borderWidth: 1,
            },
          ],
        },
        options: {
          scales: {
            y: {
              beginAtZero: true,
            },
          },
        },
      });
    }
  };
}

if (window.location.pathname.endsWith("agregar_venta.html") == true) {
  // Agregar evento para mostrar mensaje de venta según los datos del producto seleccionado
  document
    .getElementById("productoVenta")
    .addEventListener("change", function () {
      const option = this.options[this.selectedIndex];
      const cantidad = option.getAttribute("data-cantidad");
      const costo = option.getAttribute("data-costoUnitario");
      const mensajeDeVenta = document.getElementById("mensajeVenta");
      const mensajeDiv = document.getElementById("mensaje");

      document.getElementById("cantidadItems")

      if (option.text === "Seleccionar producto") {
        mensajeDiv.style.display = "none";
        return;
      } else {
        mensajeDiv.style.display = "block";
        mensajeDeVenta.innerHTML =
          "Items en stock: " +
          cantidad +
          "<br>Costo unitario del producto: " +
          costo;

          // Limpiar campos input de cantidad y valor total
        document.getElementById("cantidadItems").setAttribute("max", cantidad);
        document.getElementById("cantidadItems").value = null;
        document.getElementById("valorTotal").value = null;
      }
    });

    // Agregar evento para calcular el valor total de la venta automaticamente
    document.getElementById("cantidadItems").addEventListener("change", function () {
      const option = document.getElementById("productoVenta").options[document.getElementById("productoVenta").selectedIndex];
      const costo = option.getAttribute("data-costoUnitario");
      const valorTotal = document.getElementById("valorTotal");
      
      // Input de valor total de venta
      valorTotal.value = this.value * costo;
    }
  );
}
