package com.proyecto.sena.mgm.service;

import com.proyecto.sena.mgm.dto.ProductoEnStockParaVentaDto;
import com.proyecto.sena.mgm.entity.StockStoreProcedureEntity;

import java.util.List;

public interface StockService {

    List<StockStoreProcedureEntity> getStock();

    List<ProductoEnStockParaVentaDto> getProductosEnStockParaVenta();

    Integer getIdStock(Integer IdEntrada);
}
