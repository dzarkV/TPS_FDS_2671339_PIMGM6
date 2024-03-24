package com.proyecto.sena.mgm.repository;

import com.proyecto.sena.mgm.entity.StockEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StockRepository extends JpaRepository<StockEntity, Long> {
}
