package goodee.gdj58.booking_c;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

@ServletComponentScan
@SpringBootApplication
@EnableScheduling
public class BookingCApplication {

	public static void main(String[] args) {
		SpringApplication.run(BookingCApplication.class, args);
	}

}
