package com.proyecto.sena.mgm.service;

import java.util.List;

import com.proyecto.sena.mgm.entity.ProductosEntity;
import com.proyecto.sena.mgm.entity.VentasEntity;

public interface VentasService {

	List<VentasEntity> getAll();
	
	public VentasEntity findById(Integer id);
	
	public VentasEntity findByFechaVenta(String fechaVenta);
	
	//public ProductosEntity save(ProductosEntity producto);
	
	//public List<ProductosEntity> buscarProducto(Integer idProducto, String nombreProducto);
	
}
