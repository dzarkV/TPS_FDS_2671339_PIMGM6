package com.proyecto.sena.mgm.entity;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name = "ventas")
public class VentasEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idVenta;
		
	@Column(name = "id_stock")
	private Integer idStock;
	
	@Column(name = "fecha_venta")
	private LocalDate fechaVenta;
	
	@Column(name = "cantidad_items_venta_x_producto")
	private Integer cantidadItemsVentaXProducto;
	
	@Column(name = "valot_total_venta")
	private Integer valorTotalVenta;

	
	public VentasEntity(Integer idVenta, Integer idStock, LocalDate fechaVenta, Integer cantidadItemsVentaXProducto,
			Integer valorTotalVenta) {
		this.idVenta = idVenta;
		this.idStock = idStock;
		this.fechaVenta = fechaVenta;
		this.cantidadItemsVentaXProducto = cantidadItemsVentaXProducto;
		this.valorTotalVenta = valorTotalVenta;
	}
	
	public VentasEntity() {}

	public Integer getIdVenta() {
		return idVenta;
	}

	public void setIdVenta(Integer idVenta) {
		this.idVenta = idVenta;
	}

	public Integer getIdStock() {
		return idStock;
	}

	public void setIdStock(Integer idStock) {
		this.idStock = idStock;
	}

	public LocalDate getFechaVenta() {
		return fechaVenta;
	}

	public void setFechaVenta(LocalDate fechaVenta) {
		this.fechaVenta = fechaVenta;
	}

	public Integer getCantidadItemsVentaXProducto() {
		return cantidadItemsVentaXProducto;
	}

	public void setCantidadItemsVentaXProducto(Integer cantidadItemsVentaXProducto) {
		this.cantidadItemsVentaXProducto = cantidadItemsVentaXProducto;
	}

	public Integer getValorTotalVenta() {
		return valorTotalVenta;
	}

	public void setValorTotalVenta(Integer valorTotalVenta) {
		this.valorTotalVenta = valorTotalVenta;
	}
	

}
