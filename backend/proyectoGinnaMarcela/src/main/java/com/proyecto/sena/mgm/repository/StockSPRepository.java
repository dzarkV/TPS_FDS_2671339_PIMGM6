package com.proyecto.sena.mgm.repository;

import com.proyecto.sena.mgm.entity.StockStoreProcedureEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StockSPRepository extends JpaRepository<StockStoreProcedureEntity, Long> {
}
