package com.uanl.medicina.controllers;

import com.google.gson.Gson;
import com.uanl.medicina.model.Bitacora;
import com.uanl.medicina.model.Role;
import com.uanl.medicina.model.User;
import com.uanl.medicina.service.BitacoraService;
import com.uanl.medicina.service.ResourcesService;
import com.uanl.medicina.service.RoleService;
import com.uanl.medicina.service.UserService;
import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;
import javax.activation.MimeType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController extends MimeType implements Serializable {

    @Autowired
    UserService us;
    @Autowired
    ResourcesService resources;
    @Autowired
    RoleService roleSV;
    @Autowired
    BitacoraService bs;

    @RequestMapping(value = "/listarUsuarios")
    public @ResponseBody List listarUsuarios() {
         return us.listaUsuario();
    }
    
    @RequestMapping(value = "/agregarUsuario")
    public @ResponseBody Boolean agregarUsuario(User user) {
        
        Role role = new Role();
            role.setIdRole(2);
            Set<Role> rol = new HashSet<>();
            rol.add(role);
        user.setRoleList(rol);
        user.setPassword(user.getPassword());
        return us.agregarUsuario(user);
    }
    
    @RequestMapping(value = "/updateUser")
    public @ResponseBody Boolean userUpdate(User user) {
        Role role = new Role();
            role.setIdRole(2);
            Set<Role> rol = new HashSet<>();
            rol.add(role);
        user.setRoleList(rol);
        return us.userUpdate(user);
    }
    
    @RequestMapping(value = "/eliminarUsuario")
    public @ResponseBody Boolean deleteUser(User user) {
        return us.deleteUser(user);
    }
    
    @RequestMapping(value = "/getUserToSendMail")
    public List getUserToSendMail() {
        return us.getUserToSendMail();
    }
    
    @RequestMapping(value = "/updateUserMailSender")
    public @ResponseBody Boolean updateUserMailSender(User user) {
        Role role = new Role();
            role.setIdRole(8);
            Set<Role> rol = new HashSet<>();
            rol.add(role);
        user.setRoleList(rol);
        return us.userUpdate(user);
    }
    
}
