package com.uanl.medicina.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size; 

/**
 *
 * @author: Abdiel Salas Pérez
 */
@Entity
@Table(name = "bitacora") 
public class Bitacora implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Basic(optional = false)
    @Column(name = "idBitacora")
    private Integer idBitacora;
    @Size(max = 50)
    @Column(name = "accion")
    private String accion;
    @Size(max = 50)
    @Column(name = "modulo")
    private String modulo;
    @Size(max = 50)
    @Column(name = "fecha")
    private String fecha;
    @JoinColumn(name = "idUsuario", referencedColumnName = "idUsuario")
    @ManyToOne(fetch = FetchType.LAZY)
    private User idUsuario;
    
    public Bitacora(){
    
    }
    
    public Integer getIdEspecialidad() {
        return idBitacora;
    }

    public void setIdBitacora(Integer idBitacora) {
        this.idBitacora = idBitacora;
    }

    public String getNombre() {
        return accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }
    
    public String getModulo() {
        return modulo;
    }

    public void setModulo(String modulo) {
        this.modulo = modulo;
    }
    
    public String getFecha(){
        return fecha;
    }
    
    public void setFecha(String fecha){
        this.fecha = fecha;
    }
    
    public User getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(User idUsuario) {
        this.idUsuario = idUsuario;
    }
}