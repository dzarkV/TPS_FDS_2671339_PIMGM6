package com.proyecto.sena.mgm.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

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
	
	public List<ProductosEntity> buscarProducto(Integer idProducto, String nombreProducto) {
		if(idProducto == null && nombreProducto == null) {
			return productosrepository.findAll();
		}
		if(idProducto != null && nombreProducto == null) {
			List objeto = new ArrayList<>();
			objeto.add(productosrepository.findById(idProducto).orElse(null));
			return objeto;
		}
		if(idProducto == null && nombreProducto != null) {
			System.out.println(nombreProducto);
			return productosrepository.findByNombreProducto(nombreProducto);
		}
		return productosrepository.findByNombreProductoAndIdProducto(nombreProducto, idProducto);
	}
	
	public ProductosEntity save(ProductosEntity producto) {
		return productosrepository.save(producto);
	}
	
	public boolean actualizarProducto(Integer id, ProductosEntity producto) {
        Optional<ProductosEntity> productoExistente = productosrepository.findById(id);
        if (productoExistente.isPresent()) {
            ProductosEntity productoActualizado = productoExistente.get();
            productoActualizado.setNombreProducto(producto.getNombreProducto());
            productoActualizado.setDescripcionProducto(producto.getDescripcionProducto());
            productoActualizado.setMarca(producto.getMarca());
            productoActualizado.setReferencia(producto.getReferencia());
            productosrepository.save(productoActualizado);
            return true;
        } else {
            return false;
        }
    }

	public void eliminarProducto(Integer idProducto) {
        productosrepository.deleteById(idProducto);
    }
}
