package com.proyecto.sena.mgm.controller;

import com.proyecto.sena.mgm.entity.StockEntity;
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
    public List<StockEntity> consultarStock() {
        return stockService.getStock();
    }
}
