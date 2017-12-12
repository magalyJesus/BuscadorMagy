package com.uanl.medicina.service;

import com.uanl.medicina.dao.BitacoraDao;
import com.uanl.medicina.model.Bitacora;
import java.util.List;

import org.springframework.stereotype.Service;

/**
 *
 * @author Abdiel Salas Pérez
 */

@Service
public class BitacoraService {
    
    public Boolean agregarBitacora(Bitacora bitacora) {
        return new BitacoraDao().agregarBitacora(bitacora);
    }
    
    public List<List> listaBitacora() {
        return new BitacoraDao().listaBitacora();
    }
}
