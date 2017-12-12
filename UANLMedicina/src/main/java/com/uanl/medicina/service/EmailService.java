package com.uanl.medicina.service;
 
import com.uanl.medicina.dao.EmailDao;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMultipart;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

/**
 *
 * @author Abdiel Salas Pérez
 */
@Service
public class EmailService {
     
    public MimeMessagePreparator getMessagePreparator( String path[], String file[], String adjunt, String email, String subject, Boolean option) {
        return new EmailDao().getMessagePreparator(path, file, adjunt, email, subject, option);
    }
    
     public JavaMailSenderImpl getMailSender(String email, String password) {
         return new EmailDao().getMailSender(email, password);
     }
     
     public MimeMultipart getAdjunt(String source[], String fileName[], String info){
         return new EmailDao().getAdjunt(source, fileName, info);
     }
}
