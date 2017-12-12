package com.uanl.medicina.service;

import com.uanl.medicina.dao.*;
import com.uanl.medicina.model.Menu;
import java.io.IOException;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author Abdiel Salas Pérez
 */

@Service
public class MenuService {

    public Boolean agregarMenu(Menu menu) throws IOException {
        return new MenuDao().agregarMenu(menu);
    }

    public Boolean actualizarMenu(Menu menu) {
        return new MenuDao().actualizarMenu(menu);
    }

    public List<List> listaMenu() {
        return new MenuDao().listaMenu();
    }

    public Menu obtenerMenuPorId(Integer idMenu) {
        return new MenuDao().obtenerMenuPorId(idMenu);
    }
    
    public Boolean eliminarMenu(Menu menu) {
        return new MenuDao().eliminarMenu(menu);
    }
}
