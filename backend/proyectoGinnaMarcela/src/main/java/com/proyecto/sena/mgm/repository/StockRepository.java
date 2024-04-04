package com.proyecto.sena.mgm.repository;

import com.proyecto.sena.mgm.entity.StockEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface StockRepository extends JpaRepository<StockEntity, Integer> {
    @Query(value = "SELECT id_stock FROM stock WHERE id_entrada = :idEntrada",
     nativeQuery = true)
    Integer findIdStockByEntrada(@Param("idEntrada") Integer idEntrada);
}
