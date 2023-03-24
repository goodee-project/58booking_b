package goodee.gdj58.booking_c.service.gaeul;

import java.util.concurrent.ThreadLocalRandom;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.booking_c.util.FontColor;
import goodee.gdj58.booking_c.util.MailConfig;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class MailSendService {
	
	// 이메일 전송
	public String makeEmail(String companyEmail){

		// 1. 인증번호에 사용할 6자리 난수 생성(111111 ~ 999999)
		int randomNum = ThreadLocalRandom.current().nextInt(100000, 1000000);
		log.debug(FontColor.BLUE+"인증번호 : "+randomNum);
		
		// 전송할 이메일 양식
		String setFrom = "goodee@booking.com";
		String toMail = companyEmail;
		String title = "회원가입 인증 이메일 입니다."; // 이메일 제목 
		String content = 
				"홈페이지를 방문해주셔서 감사합니다." + 	// html 형식으로 작성
                "<br><br>" + 
			    "인증번호는 " + randomNum + " 입니다." + 
			    "<br>" + 
			    "해당 인증번호를 인증번호 확인란에 기입하여 주세요." +
			    "<br>" +
			    "<br>" + 
			    "이 메일은 인증번호 전송용 이메일이므로 회신이 불가합니다."; //이메일 내용 삽입
		
		// 2. 이메일 전송
		JavaMailSender mailSender = MailConfig.getMailSender();
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(new InternetAddress(setFrom, true));
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달
			helper.setText(content, true);
			mailSender.send(message);
			log.debug(FontColor.BLUE+"메일 전송 성공");
		} catch (MessagingException e) {
			e.printStackTrace();
			log.debug(FontColor.BLUE+"메일 전송 실패");
			return "fail"; // 실패 반환
		}
		
		//message.setSubject(title, "utf-8"); // 제목
		//message.setText(content, "utf-8", "html"); // 내용  
		//message.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); // 보낼 메일주소
		//mailSender.send(message);

		return Integer.toString(randomNum); // 인증번호 반환
	}

}
