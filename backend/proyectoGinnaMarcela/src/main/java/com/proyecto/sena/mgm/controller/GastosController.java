package com.proyecto.sena.mgm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.proyecto.sena.mgm.entity.GastosEntity;
import com.proyecto.sena.mgm.entity.ProductosEntity;
import com.proyecto.sena.mgm.service.GastosService;
import com.proyecto.sena.mgm.service.ProductoService;


@RestController
@RequestMapping(path = "api/gastos")
@CrossOrigin(origins = "*")
public class GastosController {
	
	@Autowired
	private GastosService gastosService;
	
	@GetMapping("/listado")
    public ResponseEntity<List<GastosEntity>> consultarTodos(){
        return new ResponseEntity<>(gastosService.getAll(), HttpStatus.OK);
    }
	
	@GetMapping("/listado/{id}")
    public ResponseEntity<GastosEntity> consultarPorId(@PathVariable("id") Integer idGasto){
        return new ResponseEntity<>(gastosService.findById(idGasto), HttpStatus.OK);
    }
	
	@PostMapping("/guardar")
    public ResponseEntity<GastosEntity> guardar(@RequestBody GastosEntity gasto){
        return new ResponseEntity<>(gastosService.save(gasto), HttpStatus.OK);
    }
	
//	@GetMapping("/buscar")
//    public ResponseEntity<List<GastosEntity>> buscarProducto(@RequestParam(required = false) Integer idProducto, @RequestParam(required = false) String nombreProducto){
//        return new ResponseEntity<>(GastosService.buscarProducto(idProducto, nombreProducto), HttpStatus.OK);
//    }
	

}
