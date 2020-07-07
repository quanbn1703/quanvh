package Model;


import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Ngoc Do Minh
 */
public class SendEmail {

    private final String emailSubject = "The new password send to from FPT training system";

    public void SendEmail(String emailToAddress, String textMessage) {
        final String username = "vtrinh855@gmail.com";//Enter your email
        final String password = "anhyeuem12"; //Enter your password
        Properties properties = new Properties();
        properties.put("mail.smtp.user", "username");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "25");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.EnableSSL.enable", "true");

        properties.setProperty("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        properties.setProperty("mail.smtp.socketFactory.fallback", "false");
        properties.setProperty("mail.smtp.port", "465");
        properties.setProperty("mail.smtp.socketFactory.port", "465");

        Session session = Session.getInstance(properties,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {
            Message message = new MimeMessage(session);

            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailToAddress));
            message.setSubject(emailSubject);
            message.setContent(Editor.addTable(textMessage), "text/html; charset=UTF-8");
            // send the email
            Transport.send(message);

        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }
}
