package com.proyecto.sena.mgm.service.impl;

import com.proyecto.sena.mgm.dto.ProductoEnStockParaVentaDto;
import com.proyecto.sena.mgm.entity.StockStoreProcedureEntity;
import com.proyecto.sena.mgm.repository.StockRepository;
import com.proyecto.sena.mgm.service.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class StockServiceImpl implements StockService {

    private final EntityManager entityManager;
    private final NamedParameterJdbcTemplate jdbcTemplate;

    @Autowired
    private StockRepository stockRepository;


    public StockServiceImpl(EntityManager entityManager, NamedParameterJdbcTemplate jdbcTemplate, StockRepository stockRepository) {
        this.entityManager = entityManager;
        this.jdbcTemplate = jdbcTemplate;
        this.stockRepository = stockRepository;
    }

    public List<StockStoreProcedureEntity> getStock() {
        StoredProcedureQuery storedProcedure = entityManager.createStoredProcedureQuery("sp_obtener_stock", "StockMapping");
        return storedProcedure.getResultList();
    }

    public List<ProductoEnStockParaVentaDto> getProductosEnStockParaVenta() {
        String sql = "SELECT e.id_entrada, p.nombre_producto, cantidad_items_entrada, costo_unitario FROM entradas e JOIN productos p USING(id_producto)";

        RowMapper<ProductoEnStockParaVentaDto> rowMapper = (rs, rowNum) -> {
            ProductoEnStockParaVentaDto dto = new ProductoEnStockParaVentaDto();
            dto.setIdEntrada(rs.getLong("id_entrada"));
            dto.setNombreProducto(rs.getString("nombre_producto"));
            int cantidadItemsEntrada = rs.getInt("cantidad_items_entrada");
            if (cantidadItemsEntrada > 0) {
                dto.setCantidadItemsEntrada(cantidadItemsEntrada);
                dto.setCostoUnitario(rs.getDouble("costo_unitario"));
                return dto;
            } else {
                return null; // Filter out products with quantity <= 0
            }
        };

        return jdbcTemplate.query(sql, rowMapper)
                .stream()
                .filter(Objects::nonNull) // Filter out null values
                .collect(Collectors.toList());
    }

        public Integer getIdStock(Integer idEntrada) {
        return stockRepository.findIdStockByEntrada(idEntrada);
    }
}
