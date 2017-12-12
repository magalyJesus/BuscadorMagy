package com.uanl.medicina.controllers;

import com.uanl.medicina.authenticationservice.LoginService;
import com.uanl.medicina.model.Role;
import com.uanl.medicina.model.User;
import com.uanl.medicina.service.ImagenService;
import com.uanl.medicina.service.MenuService;
import com.uanl.medicina.service.ResourcesService;
import com.uanl.medicina.service.UserService;
import java.net.UnknownHostException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Abdiel Salas Pérez
 */
@Controller
public class MainController {

    @Autowired
    LoginService login;
    @Autowired
    ResourcesService rsv;
    @Autowired
    UserService usv;
    @Autowired
    MenuService ms;
    @Autowired
    ImagenService imgSrv;
    
    @RequestMapping(value = "/")
    public String getMain() { 
        
        if (getUser() != null) {
            return "redirect:/home";
        } else {
            return "redirect:/auth";
        }
    }

    @RequestMapping(value = "home")
    public String home(ModelMap map) {
        User user = getUser();
        String role = "";

        for (Role roles : user.getRoleList()) {
            role = roles.getDescription();
        }
        
        map.addAttribute("user", user);
        map.addAttribute("role", role);
        map.addAttribute("listaImagen", imgSrv.listaImagen());
        map.addAttribute("listaMenu", ms.listaMenu());
        return "/gestion/dashboard";
    }
    
    @RequestMapping(value = "access_denied")
    public String getDenied(ModelMap map) {
        // map.addAttribute("user", getPrincipal());
        return "/authentication/access_denied";
    }

    @RequestMapping(value = "/auth")
    public String loginPage(ModelMap map) {
        if (getUser() != null) {
            return "redirect:/home";
        } else {
            map.addAttribute("listaMenu", ms.listaMenu());
            map.addAttribute("listaImagen", imgSrv.listaImagen());
            return "/authentication/auth";
        }
    }
    
    @RequestMapping(value = "/login")
    public String loginMain() {
        return "/authentication/login";
    }

    @RequestMapping(value = "/logout")
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/auth?logout";
    }

    private User getUser() {

        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            userName = ((UserDetails) principal).getUsername();
        } else {
            userName = principal.toString();
        }
        User user = login.getUserByUsername(userName);
        //user.setPassword(null);
        return user;
    }
}
