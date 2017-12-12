package com.uanl.medicina.authenticationservice;

import com.uanl.medicina.model.Role;
import com.uanl.medicina.model.User;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 *
 * @author Abdiel Salas Pérez
 */
@Service("customerUserDetailsService")
public class CustomerUserDetailsService implements UserDetailsService {

    @Autowired
    private LoginService loginService;

    @Override
    @Transactional
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        if(!email.equalsIgnoreCase("anonymousUser")){
          //  return "redirect:/";        
        User user = loginService.getUserByUsername(email);
        
        if(user==null || user.equals("")){           
            throw new UsernameNotFoundException("Username not found");
        }
        return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(), "Active".equals("Active"), true, true, true, getGrantedAuthorities(user));
    }else{
            return null;
        }
    }
    
    private List<GrantedAuthority> getGrantedAuthorities(User user){
        
        List<GrantedAuthority> authorities = new ArrayList<>();   
       for(Role roles : user.getRoleList()){                    
        authorities.add(new SimpleGrantedAuthority("ROLE_"+roles.getDescription()));
       }
       // authorities.add(new SimpleGrantedAuthority("ROLE_GESTIONMANAGER"));        
        System.out.println("Authorities"+authorities);
        return authorities;
    }   
}