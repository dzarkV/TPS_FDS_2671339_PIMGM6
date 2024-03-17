package com.proyecto.sena.mgm.service;

import java.util.List;

import com.proyecto.sena.mgm.entity.GastosEntity;
import com.proyecto.sena.mgm.entity.ProductosEntity;

public interface GastosService {

	List<GastosEntity> getAll();
	
	public GastosEntity findById(Integer id);
	
	public GastosEntity save(GastosEntity gasto);
	
//	public List<GastosEntity> buscarGasto(Integer idGasto, String tipoDeGasto);
//	
}
