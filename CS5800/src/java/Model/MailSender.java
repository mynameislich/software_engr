/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author LICH
 */
import javax.mail.*;
import java.util.*;
import javax.mail.internet.*;

public class MailSender {

    String host = "smtp.live.com";
    String user = "zuoyuan-zhao@outlook.com";
    String pass = "1a2a3a4a";
    String to = "zuoyuan-zhao@uiowa.edu";
    String from = "zuoyuan-zhao@outlook.com";
    String subject = "registration confirmation email";
    String text = "welcome to team 12 airline, this is a confirmation email.\n Here is your comfirmation code";
    Properties props = System.getProperties();
    boolean sessionDebug = false;

    public void send(String email, String code) throws AddressException, MessagingException {
        try {
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("auth", "true");
            props.put("mail.smtp.starttls.required", "true");
            text = text + ":" + code;
            java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            Session mailSession = Session.getDefaultInstance(props, null);
            mailSession.setDebug(sessionDebug);
            Message msg = new MimeMessage(mailSession);
            msg.setFrom(new InternetAddress(from));
            InternetAddress address = new InternetAddress(to);
            msg.setRecipient(Message.RecipientType.TO, address);
            msg.setSubject(subject);
            msg.setSentDate(new Date());
            msg.setText(text);
            Transport transport = mailSession.getTransport("smtp");
            transport.connect(host, user, pass);
            transport.sendMessage(msg, msg.getAllRecipients());
            transport.close();
            System.out.println("YES!!!!");
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
}
