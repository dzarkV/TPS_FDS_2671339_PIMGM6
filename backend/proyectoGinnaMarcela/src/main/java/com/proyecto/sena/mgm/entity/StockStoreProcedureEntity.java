package com.proyecto.sena.mgm.entity;

import javax.persistence.*;

@Entity
@SqlResultSetMapping(
        name = "StockMapping",
        classes = @ConstructorResult(
                targetClass = StockStoreProcedureEntity.class,
                columns = {
                        @ColumnResult(name = "idProducto", type = Long.class),
                        @ColumnResult(name = "nombreProducto", type = String.class),
                        @ColumnResult(name = "nombreProveedor", type = String.class),
                        @ColumnResult(name = "cantidad", type = Integer.class),
                        @ColumnResult(name = "costoTotal", type = Double.class)
                }
        )
)
public class StockStoreProcedureEntity {
    @Id
    private Long idProducto;
    private String nombreProducto;
    private String nombreProveedor;
    private int cantidad;
    private double costoTotal;

    public StockStoreProcedureEntity(Long idProducto, String nombreProducto, String nombreProveedor, int cantidad, double costoTotal) {
        this.idProducto = idProducto;
        this.nombreProducto = nombreProducto;
        this.nombreProveedor = nombreProveedor;
        this.cantidad = cantidad;
        this.costoTotal = costoTotal;
    }

    public StockStoreProcedureEntity() {

    }

    public Long getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(Long idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getNombreProveedor() {
        return nombreProveedor;
    }

    public void setNombreProveedor(String nombreProveedor) {
        this.nombreProveedor = nombreProveedor;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getCostoTotal() {
        return costoTotal;
    }

    public void setCostoTotal(double costoTotal) {
        this.costoTotal = costoTotal;
    }
}
