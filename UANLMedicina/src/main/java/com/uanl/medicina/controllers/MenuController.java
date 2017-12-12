package com.uanl.medicina.controllers;

import com.uanl.medicina.model.Menu;
import com.uanl.medicina.service.MenuService;
import com.uanl.medicina.service.ResourcesService;
import java.io.IOException;
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
public class MenuController {

    @Autowired
    MenuService ms;
    @Autowired
    ResourcesService resources;
    
    @RequestMapping(value = "/agregarMenu")
    public @ResponseBody Boolean agregarMenu(Menu menu) throws IOException {
        return ms.agregarMenu(menu);
    }
    
    @RequestMapping(value = "/listaMenus")
    public @ResponseBody List listaMenus() {
        return ms.listaMenu();
    }
    
    @RequestMapping(value = "/actualizarMenu")
    public @ResponseBody Boolean actualizarMenu(Menu menu) {
        return ms.actualizarMenu(menu);
    }
    
    @RequestMapping(value = "/obtenerMenuPorId")
    public @ResponseBody Menu obtenerMenuPorId(Integer idMenu) {
        return ms.obtenerMenuPorId(idMenu);
    }
    
    @RequestMapping(value = "/eliminarMenu")
    public @ResponseBody Boolean eliminarMenu(Menu menu) {
        return ms.eliminarMenu(menu);
    }
    
    @RequestMapping(value = "/menussubmenus")
    public String menusSubmenus(Menu menu) {
        return "/authentication/jspbymenus/main";
    }
}