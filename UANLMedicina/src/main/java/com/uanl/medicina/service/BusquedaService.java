package com.uanl.medicina.service;

import com.uanl.medicina.dao.BusquedaDao;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author Abdiel Salas Pérez
 */
@Service
public class BusquedaService {

    public List<List> listarBusqueda(String palabra) {
        return new BusquedaDao().listarBusqueda(palabra);
    }
    public List<List> buscar(String palabra) {
        return new BusquedaDao().buscar(palabra);
    }
}
