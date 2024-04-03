package com.proyecto.sena.mgm.controller;

import java.time.LocalDate;
import java.util.List;

import com.proyecto.sena.mgm.service.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
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

import com.proyecto.sena.mgm.entity.ProductosEntity;
import com.proyecto.sena.mgm.entity.VentasEntity;
import com.proyecto.sena.mgm.repository.VentasRepository;
import com.proyecto.sena.mgm.service.ProductoService;
import com.proyecto.sena.mgm.service.VentasService;
import org.webjars.NotFoundException;


@RestController
@RequestMapping(path = "api/ventas")
@CrossOrigin(origins = "*")

public class VentasController {
	
	@Autowired
	private VentasService ventasService;
//	private VentasRepository ventasRepository;
    @Autowired
    private StockService stockService;
	
	@GetMapping("/listado")
    public ResponseEntity<List<VentasEntity>> consultarTodos(){
        return new ResponseEntity<>(ventasService.getAll(), HttpStatus.OK);
    }
	
	@GetMapping("/listado/{id}")
    public ResponseEntity<VentasEntity> consultarPorId(@PathVariable("id") Integer idVenta){
        return new ResponseEntity<>(ventasService.findById(idVenta), HttpStatus.OK);
    }
	
	@PostMapping("/guardar")
    public ResponseEntity<VentasEntity> guardar(@RequestParam Integer idEntrada, @RequestBody VentasEntity venta){
        System.out.println(idEntrada);
        Integer idStock = stockService.getIdStock(idEntrada);
        if (idStock == null) {
            throw new NotFoundException("No se encontró ningún idStock para el idEntrada proporcionado: " + idEntrada);
        }
        venta.setIdStock(idStock);

        return new ResponseEntity<>(ventasService.save(venta), HttpStatus.OK);
    }
	
	@GetMapping("/total/dia")
    public ResponseEntity<Integer> getTotalVentasDia(
            @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate fecha) {
        int totalVentasDia = ventasService.getTotalVentaDia(fecha);
        return ResponseEntity.ok(totalVentasDia);
    }
	
	@GetMapping("/total/semana")
    public ResponseEntity<Integer> getTotalVentasSemana(
            @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate fecha) {
        int totalVentasSemana = ventasService.getTotalVentaSemana(fecha);
        return ResponseEntity.ok(totalVentasSemana);
    }

    @GetMapping("/total/mes")
    public ResponseEntity<Integer> getTotalVentasMes(
            @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate fecha) {
        int totalVentasMes = ventasService.getTotalVentaMes(fecha);
        return ResponseEntity.ok(totalVentasMes);
    }
	
//	@PostMapping("/reporte")
//    public Integer reporteVentaDiaria(@RequestBody VentasEntity venta){
//        return new ResponseEntity<>(ventasService.save(venta), HttpStatus.OK);
//    }
	
//	
//	@GetMapping("/buscar")
//    public ResponseEntity<List<VentasEntity>> buscarProducto(@RequestParam(required = false) Integer idProducto, @RequestParam(required = false) String nombreProducto){
//        return new ResponseEntity<>(VentasService.buscarVenta(idProducto, nombreProducto), HttpStatus.OK);
//    }
	

}
