package goodee.gdj58.booking_c;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@ServletComponentScan
@SpringBootApplication
public class BookingCApplication {

	public static void main(String[] args) {
		SpringApplication.run(BookingCApplication.class, args);
	}

}
