package com.proyecto.sena.mgm.service.impl;

import com.proyecto.sena.mgm.entity.StockEntity;
import com.proyecto.sena.mgm.service.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;
import java.util.List;

@Service
public class StockServiceImpl implements StockService {

    @Autowired
    private final EntityManager entityManager;

    public StockServiceImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public List<StockEntity> getStock() {
        StoredProcedureQuery storedProcedure = entityManager.createStoredProcedureQuery("sp_obtener_stock", "StockMapping");
        return storedProcedure.getResultList();
    }
}
