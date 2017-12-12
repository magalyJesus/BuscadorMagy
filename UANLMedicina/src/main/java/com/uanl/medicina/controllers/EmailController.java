package com.uanl.medicina.controllers;

import com.uanl.medicina.service.EmailService;
import com.uanl.medicina.service.ResourcesService;
import com.uanl.medicina.service.UserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Abdiel Salas Pérez
 */
@Controller
public class EmailController {

    @Autowired
    EmailService eservice;
    @Autowired
    ResourcesService rs;
    @Autowired
    UserService us;

    @RequestMapping(value = "sendMail")
    public String sendMail(String nombre, String apellidos, String correo, String telefono, String mensage) {
        
        String response = "redirect:/errorUpload";
        String date = rs.dateRangeDate(0, "Si");
        List<List> userMailSender = us.getUserToSendMail();
        
        String email = userMailSender.get(0).get(1)+"";
        String password = userMailSender.get(0).get(2)+"";

        String message = "Estimado Administrador, el usuarios de nombre: " + nombre + " " + apellidos
                + "\nCorreo electrónico: " + correo
                + "\nTeléfono: " + telefono
                + "\nHa enviádo el siguiente mensage: " + mensage + "\nFecha: " + date;

        MimeMessagePreparator preparator = eservice.getMessagePreparator(null, null, message, email, "Petición de información de usuario", false);
        JavaMailSenderImpl mailSender = eservice.getMailSender(email, password);
        try {
            mailSender.send(preparator);
            response = "redirect:/";
        } catch (MailException ex) {
        }
        return response;
    }
}
