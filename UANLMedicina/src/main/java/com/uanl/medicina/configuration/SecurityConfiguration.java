package com.uanl.medicina.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 *
 * @author Abdiel Salas Pérez
 */
@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Autowired
    @Qualifier("customerUserDetailsService")
    UserDetailsService userDetail;

    @Autowired
    public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetail);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/", "/auth", "access_denied", "/login", "sendMail", "/listaBusqueda", 
                        "/buscar", "/vistaBusqueda", "/errorUpload", "/logout", "listaMenus", "/listarImagenes").permitAll()
                
                .antMatchers("/gestionmanager", "/updateUserMailSender", "/getUserToSendMail", "/eliminarUsuario", "/updateUser", 
                        "/agregarUsuario", "/listarUsuarios", "/agregarMenu", "/actualizarMenu", "/obtenerMenuPorId",
                        "/eliminarMenu", "/listaBitacora").access("hasRole('ROLE_ADMINISTRADOR')")
                
                .antMatchers("/uploadFile", "/editarImagen", "/editarImagen1", "/eliminarImagen", 
                        "/atulizarDescripcionImagen", "/agregarBitacora").access("hasAnyRole('ROLE_ADMINISTRADOR', 'ROLE_EDITOR')")
                .and()
                .formLogin()
                .loginPage("/auth")
                .failureUrl("/?error")
                .defaultSuccessUrl("/home")
                .usernameParameter("email").passwordParameter("password")
                .and()
                .csrf()
                .and().exceptionHandling().accessDeniedPage("/access_denied")
                .and().logout().invalidateHttpSession(true).deleteCookies("JSESSIONID").logoutUrl("/logout");
        
    }
}

