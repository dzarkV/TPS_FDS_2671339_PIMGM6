package com.proyecto.sena.mgm.dto;

public class ProductoEnStockParaVentaDto {
    private Long idEntrada;
    private String nombreProducto;
    private Integer cantidadItemsEntrada;
    private Double costoUnitario;

    public Long getIdEntrada() {
        return idEntrada;
    }

    public void setIdEntrada(Long idEntrada) {
        this.idEntrada = idEntrada;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public Integer getCantidadItemsEntrada() {
        return cantidadItemsEntrada;
    }

    public void setCantidadItemsEntrada(Integer cantidadItemsEntrada) {
        this.cantidadItemsEntrada = cantidadItemsEntrada;
    }

    public Double getCostoUnitario() {
        return costoUnitario;
    }

    public void setCostoUnitario(Double costoUnitario) {
        this.costoUnitario = costoUnitario;
    }
}
