package com.proyecto.sena.mgm.entity;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "ENTRADAS")
public class EntradasEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idEntrada;

    @Column(name = "fecha_entrada")
    private LocalDate fechaEntrada;

    @Column(name = "cantidad_items_entrada")
    private int cantidadItemsEntrada;

    @Column(name = "costo_unitario")
    private double costoUnitario;

    @ManyToOne
    @JoinColumn(name = "id_proveedor")
    private ProveedoresEntity proveedor;

    @ManyToOne
    @JoinColumn(name = "id_producto")
    private ProductosEntity producto;

    public EntradasEntity(Integer idEntrada, LocalDate fechaEntrada, int cantidadItemsEntrada, double costoUnitario, ProveedoresEntity proveedor, ProductosEntity producto) {
        this.idEntrada = idEntrada;
        this.fechaEntrada = fechaEntrada;
        this.cantidadItemsEntrada = cantidadItemsEntrada;
        this.costoUnitario = costoUnitario;
        this.proveedor = proveedor;
        this.producto = producto;
    }

    public EntradasEntity() {
        
    }

    // Getter and setters
    public Integer getIdEntrada() {
        return idEntrada;
    }

    public void setIdEntrada(Integer idEntrada) {
        this.idEntrada = idEntrada;
    }

    public LocalDate getFechaEntrada() {
        return fechaEntrada;
    }

    public void setFechaEntrada(LocalDate fechaEntrada) {
        this.fechaEntrada = fechaEntrada;
    }

    public int getCantidadItemsEntrada() {
        return cantidadItemsEntrada;
    }

    public void setCantidadItemsEntrada(int cantidadItemsEntrada) {
        this.cantidadItemsEntrada = cantidadItemsEntrada;
    }

    public double getCostoUnitario() {
        return costoUnitario;
    }

    public void setCostoUnitario(double costoUnitario) {
        this.costoUnitario = costoUnitario;
    }

    public ProveedoresEntity getProveedor() {
        return proveedor;
    }

    public void setProveedor(ProveedoresEntity proveedor) {
        this.proveedor = proveedor;
    }

    public ProductosEntity getProducto() {
        return producto;
    }

    public void setProducto(ProductosEntity producto) {
        this.producto = producto;
    }
}
