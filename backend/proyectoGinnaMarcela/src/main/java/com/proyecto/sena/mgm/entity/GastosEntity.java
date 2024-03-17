package com.proyecto.sena.mgm.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name = "gastos")
public class GastosEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idGasto;
		
	@Column(name = "tipo_gasto")
	private String tipoGasto;
	
	@Column(name = "valor_gasto")
	private Integer valorGasto;
		
	public GastosEntity(Integer idGasto, String tipoGasto, Integer valorGasto) {
		this.idGasto = idGasto;
		this.tipoGasto = tipoGasto;
		this.valorGasto = valorGasto;
	}
	
	public GastosEntity() {}

	public Integer getIdGasto() {
		return idGasto;
	}

	public void setIdGasto(Integer idGasto) {
		this.idGasto = idGasto;
	}

	public String getTipoGasto() {
		return tipoGasto;
	}

	public void setTipoGasto(String tipoGasto) {
		this.tipoGasto = tipoGasto;
	}

	public Integer getValorGasto() {
		return valorGasto;
	}

	public void setValorGasto(Integer valorGasto) {
		this.valorGasto = valorGasto;
	}
		
}
