package com.proyecto.sena.mgm.repository;

import com.proyecto.sena.mgm.entity.EntradasEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EntradasRepository extends JpaRepository<EntradasEntity, Integer> {
}
