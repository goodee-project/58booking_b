package goodee.gdj58.booking_c.util;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {
    
    @Bean
    public static JavaMailSender getMailSender() {
        
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);
        mailSender.setUsername("rhakq23@gmail.com");
        mailSender.setPassword("jhydzbymphtpahqt");
        
        Properties javaMailProperties = new Properties();
        
        javaMailProperties.put("mail.smtp.starttls.enable", "true");
        javaMailProperties.put("mail.smtp.auth", "true");
        javaMailProperties.put("mail.transport.protocol", "smtp");
        javaMailProperties.put("mail.debug", "true");
        // Could not convert socket to TLS 오류 해결
        javaMailProperties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        javaMailProperties.put("mail.smtp.ssl.protocols", "TLSv1.2");
 
        mailSender.setJavaMailProperties(javaMailProperties);
        
        return mailSender;
    }
}

