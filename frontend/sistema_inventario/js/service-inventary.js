function listarProveedoresEnSelect() {
    fetch('https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/proveedores/listado')
        .then(response => response.json())
        .then(data => {
            const select = document.getElementById('proveedor');
            data.forEach(proveedor => {
                const option = document.createElement('option');
                option.value = proveedor.idProveedor;
                option.text = proveedor.nombreProveedor;
                select.appendChild(option);
            });
        })
        .catch(error => console.error('Error:', error));
  }
  
  function listarProductosEnSelect() {
    fetch('https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/productos/listado')
        .then(response => response.json())
        .then(data => {
            const select = document.getElementById('productos');
            data.forEach(producto => {
                const option = document.createElement('option');
                option.value = producto.idProducto;
                option.text = producto.nombreProducto;
                select.appendChild(option);
            });
        })
        .catch(error => console.error('Error:', error));
  }

function agregarEntrada(event) {
     event.preventDefault();
 
     const proveedorId = document.getElementById('proveedor').value;
     const productoId = document.getElementById('productos').value;
     const cantidad = document.getElementById('cantidad').value;
     const fecha = document.getElementById('fecha').value;
     const costoUnitario = document.getElementById('costoUnitario').value;

     if (!proveedorId === "Seleccione un proveedor" || !productoId === "Seleccione un producto" || !cantidad || !fecha || !costoUnitario) {
         alert('Por favor, llene todos los campos');
         return;
     }
 
     const data = { 
        proveedor: { idProveedor: parseInt(proveedorId) },
        producto: { idProducto: parseInt(productoId) },
        cantidadItemsEntrada: parseInt(cantidad),
        fechaEntrada: fecha,
        costoUnitario: parseFloat(costoUnitario) };
        console.log(data);
        
     fetch('https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/entradas/guardar', {
         method: 'POST',
         headers: {
             'Content-Type': 'application/json',
         },
         body: JSON.stringify(data),
     })
     .then(response => {
         if (!response.ok) {
             throw new Error('Sin respuesta del servidor. \n Por favor, intente más tarde.');
         }
         return response.json();
     })
     .then(() => {
         alert('Entrada agregada con éxito');
         window.location.reload();
     })
     .catch((error) => {
         alert('Ha ocurrido un error: ' + error);
     });
 }

function listarInventario() {
    const table = document.getElementById('tablaInventario');

    fetch('https://sistema-mgm-service-app-for-inventary.azurewebsites.net/api/stock')
    .then(response => response.json())
    .then(data => {
        data.forEach(entrada => {
            const row = table.insertRow();
            row.innerHTML = `<td>${entrada.nombreProveedor}</td>
            <td>${entrada.nombreProducto}</td>
            <td>${entrada.cantidad}</td>
            <td>${entrada.costoTotal}</td>`;
        });
    })
    .catch(error => console.error('Error:', error));

    
}


