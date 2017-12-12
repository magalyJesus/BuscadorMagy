/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uanl.medicina.service;

import com.uanl.medicina.dao.UserDao;
import com.uanl.medicina.model.User;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author PrismaGram
 */
@Service
public class UserService {

    public Boolean agregarUsuario(User user) {
        return new UserDao().agregarUsuario(user);
    }

    public User getUserByEmail(String email){
        return new UserDao().getUserByUsername(email);
    }
    
    public List<List> getUser(String email) {
        return new UserDao().getUserByEmail(email);
    }
    
    public Boolean userUpdate(User user) {
        return new UserDao().userUpdate(user);
    }
    
    public List<List> listaUsuario() {
        return new UserDao().listaUsuario();
    }
    
    public Boolean deleteUser(User user) {
        return new UserDao().deleteUser(user);
    }
    
    public List<List> getUserToSendMail() {
        return new UserDao().getUserToSendMail();
    }
}
