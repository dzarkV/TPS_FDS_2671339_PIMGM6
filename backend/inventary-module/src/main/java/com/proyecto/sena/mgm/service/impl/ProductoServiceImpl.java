package com.proyecto.sena.mgm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proyecto.sena.mgm.entity.ProductosEntity;
import com.proyecto.sena.mgm.repository.Productosrepository;
import com.proyecto.sena.mgm.service.ProductoService;

@Service
public class ProductoServiceImpl implements ProductoService {

	@Autowired
	private Productosrepository productosrepository;
	
	public List<ProductosEntity> getAll() {
		return productosrepository.findAll();
	}
	
	public ProductosEntity findById(Integer id) {
		return productosrepository.findById(id).orElse(null);
	}
	
	public ProductosEntity save(ProductosEntity producto) {
		return productosrepository.save(producto);
	}

	public void delete(Integer id) {
		 productosrepository.deleteById(id);
	}

}
