package com.uanl.medicina.dao;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessagePreparator;

/**
 *
 * @author Abdiel Salas Pérez
 */
public class EmailDao {

    public JavaMailSenderImpl getMailSender(String email, String password) {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);
        //mailSender.setPort(465);

        mailSender.setUsername(email);
        mailSender.setPassword(password);

        //mailSender.setUsername("galloprismagram@gmail.com");
        // mailSender.setPassword("grupoprisma");      
        Properties javaMailProperties = new Properties();
        javaMailProperties.put("mail.smtp.starttls.enable", "true");
        javaMailProperties.put("mail.smtp.auth", "true");
        javaMailProperties.put("mail.transport.protocol", "smtp");
        javaMailProperties.put("mail.debug", "true");
        mailSender.setJavaMailProperties(javaMailProperties);
        return mailSender;
    }

    public MimeMessagePreparator getMessagePreparator(final String path[], final String file[], final String adjunt, final String email, final String subject, final Boolean option) {

        MimeMessagePreparator preparator = new MimeMessagePreparator() {
            @Override
            public void prepare(MimeMessage mimeMessage) throws Exception {
                mimeMessage.setFrom(email);
                mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
                //mimeMessage.setRecipients(Message.RecipientType.TO, email);
                mimeMessage.setSubject(subject);

                if (option) {
                    mimeMessage.setContent(getAdjunt(path, file, adjunt));
                } else {
                    mimeMessage.setText(adjunt);
                }
            }
        };
        return preparator;
    }

    public MimeMultipart getAdjunt(String source[], String fileName[], String info) {
        MimeMultipart multiParte = new MimeMultipart();
        BodyPart adjunto = new MimeBodyPart();
        BodyPart adjunto1 = new MimeBodyPart();
        BodyPart texto = new MimeBodyPart();

        try {
            adjunto.setDataHandler(new DataHandler(new FileDataSource(source[0])));
            adjunto1.setDataHandler(new DataHandler(new FileDataSource(source[1])));
            adjunto.setFileName(fileName[0]);
            adjunto1.setFileName(fileName[1]);
            
            texto.setText(info);
            multiParte.addBodyPart(texto);
            multiParte.addBodyPart(adjunto);
            multiParte.addBodyPart(adjunto1);
            return multiParte;
        } catch (MessagingException ex) {
            Logger.getLogger(EmailDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
