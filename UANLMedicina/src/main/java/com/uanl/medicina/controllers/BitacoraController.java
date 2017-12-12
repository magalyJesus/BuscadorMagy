package com.uanl.medicina.controllers;

import com.uanl.medicina.model.Bitacora;
import com.uanl.medicina.service.BitacoraService;
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
public class BitacoraController {
    
    @Autowired
    BitacoraService bs;
    
    @RequestMapping(value = "agregarBitacora")
    public @ResponseBody Boolean agregarBitacora(Bitacora bitacora) {
        return bs.agregarBitacora(bitacora);
    }
    
    @RequestMapping(value = "listaBitacora")
    public @ResponseBody List listaBitacora() {
        return bs.listaBitacora();
    }
}
