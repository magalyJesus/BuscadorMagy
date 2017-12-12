package com.uanl.medicina.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

/**
 *
 * @author: Abdiel Salas Pérez
 */
@Entity
@Table(name = "busqueda") 
public class Busqueda implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Basic(optional = false)
    @Column(name = "idBusqueda")
    private Long idBusqueda;  
    @Size(max = 100)
    @Column(name = "titulo")
    private String titulo;
    @Size(max = 100)
    @Column(name = "resumen")
    private String resumen;
    @Size(max = 100)
    @Column(name = "status")
    private String status;
    @Size(max = 100)
    @Column(name = "periodoReclutamiento")
    private String periodoReclutamiento;
    @Size(max = 100)
    @Column(name = "fechaInicio")
    private String fechaInicio;
    @Size(max = 100)
    @Column(name = "noAutorizacion")
    private String noAutorizacion;
    @Size(max = 100)
    @Column(name = "tipoEstudio")
    private String tipoEstudio;
    @Size(max = 100)
    @Column(name = "claveRegistro")
    private String claveRegistro;
    @Size(max = 100)
    @Column(name = "noEstudio")
    private String noEstudio;
    @Size(max = 100)
    @Column(name = "compFarmaceutica")
    private String compFarmaceutica;
    @Size(max = 100)
    @Column(name = "CRO")
    private String CRO;
    @Size(max = 100)
    @Column(name = "fechaAprobacion")
    private String fechaAprobacion;
    @Size(max = 100)
    @Column(name = "fechaAutorizacion")
    private String fechaAutorizacion;
    @Size(max = 100)
    @Column(name = "investPrincipal")
    private String investPrincipal;
    @Size(max = 100)
    @Column(name = "sitioInvestigacion")
    private String sitioInvestigacion;
    @Size(max = 100)
    @Column(name = "direccionSitio")
    private String direccionSitio;
    @Size(max = 100)
    @Column(name = "telefonoSitio")
    private String telefonoSitio;
    @Size(max = 100)
    @Column(name = "datosContacto")
    private String datosContacto;
    @Size(max = 100)
    @Column(name = "procedimientoEnfermedad")
    private String procedimientoEnfermedad;
    @Size(max = 100)
    @Column(name = "procedimientoIntervencion")
    private String procedimientoIntervcion;
    @Size(max = 100)
    @Column(name = "requisitos")
    private String requisitos;
    
    public Busqueda() {
        
    }
    
    public Long getIdBusqueda() {
        return idBusqueda;
    }

    public void setIdBusqueda(Long idBusqueda) {
        this.idBusqueda = idBusqueda;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getResumen() {
        return resumen;
    }

    public void setResumen(String resumen) {
        this.resumen = resumen;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPeriodoReclutamiento() {
        return periodoReclutamiento;
    }

    public void setPeriodoReclutamiento(String periodoReclutamiento) {
        this.periodoReclutamiento = periodoReclutamiento;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public String getNoAutorizacion() {
        return noAutorizacion;
    }

    public void setNoAutorizacion(String noAutorizacion) {
        this.noAutorizacion = noAutorizacion;
    }

    public String getTipoEstudio() {
        return tipoEstudio;
    }

    public void setTipoEstudio(String tipoEstudio) {
        this.tipoEstudio = tipoEstudio;
    }

    public String getClaveRegistro() {
        return claveRegistro;
    }

    public void setClaveRegistro(String claveRegistro) {
        this.claveRegistro = claveRegistro;
    }

    public String getNoEstudio() {
        return noEstudio;
    }

    public void setNoEstudio(String noEstudio) {
        this.noEstudio = noEstudio;
    }

    public String getCompFarmaceutica() {
        return compFarmaceutica;
    }

    public void setCompFarmaceutica(String compFarmaceutica) {
        this.compFarmaceutica = compFarmaceutica;
    }

    public String getCRO() {
        return CRO;
    }

    public void setCRO(String CRO) {
        this.CRO = CRO;
    }

    public String getFechaAprobacion() {
        return fechaAprobacion;
    }

    public void setFechaAprobacion(String fechaAprobacion) {
        this.fechaAprobacion = fechaAprobacion;
    }

    public String getFechaAutorizacion() {
        return fechaAutorizacion;
    }

    public void setFechaAutorizacion(String fechaAutorizacion) {
        this.fechaAutorizacion = fechaAutorizacion;
    }

    public String getInvestPrincipal() {
        return investPrincipal;
    }

    public void setInvestPrincipal(String investPrincipal) {
        this.investPrincipal = investPrincipal;
    }

    public String getSitioInvestigacion() {
        return sitioInvestigacion;
    }

    public void setSitioInvestigacion(String sitioInvestigacion) {
        this.sitioInvestigacion = sitioInvestigacion;
    }

    public String getDireccionSitio() {
        return direccionSitio;
    }

    public void setDireccionSitio(String direccionSitio) {
        this.direccionSitio = direccionSitio;
    }

    public String getTelefonoSitio() {
        return telefonoSitio;
    }

    public void setTelefonoSitio(String telefonoSitio) {
        this.telefonoSitio = telefonoSitio;
    }

    public String getDatosContacto() {
        return datosContacto;
    }

    public void setDatosContacto(String datosContacto) {
        this.datosContacto = datosContacto;
    }

    public String getProcedimientoEnfermedad() {
        return procedimientoEnfermedad;
    }

    public void setProcedimientoEnfermedad(String procedimientoEnfermedad) {
        this.procedimientoEnfermedad = procedimientoEnfermedad;
    }

    public String getProcedimientoIntervcion() {
        return procedimientoIntervcion;
    }

    public void setProcedimientoIntervcion(String procedimientoIntervcion) {
        this.procedimientoIntervcion = procedimientoIntervcion;
    }

    public String getRequisitos() {
        return requisitos;
    }

    public void setRequisitos(String requisitos) {
        this.requisitos = requisitos;
    }
}

