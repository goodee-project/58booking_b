package goodee.gdj58.booking_c.restcontroller.taehee;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@EnableScheduling
public class SchedulerApplication  {

    public static void main(String[] args) {
        SpringApplication.run(SchedulerApplication.class, args);
    }

}