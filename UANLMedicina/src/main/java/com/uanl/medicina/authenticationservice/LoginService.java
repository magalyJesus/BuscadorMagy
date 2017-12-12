package com.uanl.medicina.authenticationservice;

import com.uanl.medicina.dao.UserDao;
import com.uanl.medicina.model.User;
import org.springframework.stereotype.Service;

/**
 *
 * @author Abdiel Salas Pérez
 */
@Service("loginService")
public class LoginService {
    public User getUserByUsername(String username){
        return new UserDao().getUserByUsername(username);
    }
}
