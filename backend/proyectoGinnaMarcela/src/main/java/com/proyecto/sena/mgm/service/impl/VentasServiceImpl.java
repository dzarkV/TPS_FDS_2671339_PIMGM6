package com.proyecto.sena.mgm.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.proyecto.sena.mgm.entity.ProductosEntity;
import com.proyecto.sena.mgm.entity.VentasEntity;
import com.proyecto.sena.mgm.repository.Productosrepository;
import com.proyecto.sena.mgm.repository.VentasRepository;
import com.proyecto.sena.mgm.service.ProductoService;
import com.proyecto.sena.mgm.service.VentasService;
import java.util.Optional;
	

@Service
public class VentasServiceImpl implements VentasService {

	@Autowired
	private VentasRepository ventasRepository;
	
	public List<VentasEntity> getAll() {
		return ventasRepository.findAll();
	}
	
	public VentasEntity findById(Integer id) {
		return ventasRepository.findById(id).orElse(null);
	}
	
//	public VentasEntity findByFechaVenta(String fechaVenta) {
//	return ventasRepository.findByFechaVenta(fechaVenta).orElse(null);
//}	
	
//	public ProductosEntity save(ProductosEntity producto) {
//		return productosrepository.save(producto);
//	}

//	public void delete(Integer id) {
//		 productosrepository.deleteById(id);
//	}

}
