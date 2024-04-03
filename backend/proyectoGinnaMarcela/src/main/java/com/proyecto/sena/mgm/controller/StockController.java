package com.proyecto.sena.mgm.controller;

import com.proyecto.sena.mgm.dto.ProductoEnStockParaVentaDto;
import com.proyecto.sena.mgm.entity.StockStoreProcedureEntity;
import com.proyecto.sena.mgm.service.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(path = "api/stock")
@CrossOrigin(origins = "*")
public class StockController {

    @Autowired
    private StockService stockService;

    @GetMapping
    public List<StockStoreProcedureEntity> consultarStock() {
        return stockService.getStock();
    }

    @GetMapping("/productosEnStockParaVenta")
    public List<ProductoEnStockParaVentaDto> consultarProductosEnStockParaVenta() {
        return stockService.getProductosEnStockParaVenta();
    }
}
