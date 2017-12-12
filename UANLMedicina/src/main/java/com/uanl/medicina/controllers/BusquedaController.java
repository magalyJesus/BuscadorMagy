package com.uanl.medicina.controllers;

import com.uanl.medicina.service.BusquedaService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Abdiel Salas Pérez
 */
@Controller
public class BusquedaController {
    
    @Autowired
    BusquedaService busquedaSv;
    
    @RequestMapping(value = "listaBusqueda")
    public @ResponseBody List listarBusqueda(String palabra) {
        return busquedaSv.listarBusqueda(palabra);
    }
    
    @RequestMapping(value = "buscar")
    public @ResponseBody List buscar(String palabra) {
        return busquedaSv.buscar(palabra);
    }
    
    @RequestMapping(value = "vistaBusqueda")
    public String vistaBusqueda() {
        return "/authentication/page/busqueda";
    }
}