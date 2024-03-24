package com.proyecto.sena.mgm.controller;

import com.proyecto.sena.mgm.entity.EntradasEntity;
import com.proyecto.sena.mgm.entity.ProductosEntity;
import com.proyecto.sena.mgm.entity.ProveedoresEntity;
import com.proyecto.sena.mgm.service.EntradasService;
import com.proyecto.sena.mgm.service.ProductoService;
import com.proyecto.sena.mgm.service.ProveedoresService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "api/entradas")
@CrossOrigin(origins = "*")
public class EntradasController {

    @Autowired
    private EntradasService entradasService;

    @Autowired
    private ProveedoresService proveedoresService;

    @Autowired
    private ProductoService productoService;

    @GetMapping("/listado")
    public ResponseEntity<List<EntradasEntity>> consultarTodos(){
        return new ResponseEntity<>(entradasService.getAll(), HttpStatus.OK);
    }

    @PostMapping("/guardar")
    public ResponseEntity<EntradasEntity> guardar(@RequestBody EntradasEntity entrada){
        // Buscar el producto por su ID
        ProductosEntity producto = productoService.findById(entrada.getProducto().getIdProducto());

        // Buscar el proveedor por su ID
        ProveedoresEntity proveedor = proveedoresService.findById(entrada.getProveedor().getIdProveedor());

        // Configurar el producto y el proveedor en la entrada
        entrada.setProducto(producto);
        entrada.setProveedor(proveedor);

        // Guardar la entrada en la base de datos
        return new ResponseEntity<>(entradasService.save(entrada), HttpStatus.OK);
    }
}
