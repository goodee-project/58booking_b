package goodee.gdj58.booking_c.service.gaeul;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import goodee.gdj58.booking_c.mapper.gaeul.CompanyImgMapper2;
import goodee.gdj58.booking_c.util.FontColor;
import goodee.gdj58.booking_c.vo.CompanyImg;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CompanyImgService2 {
	@Autowired CompanyImgMapper2 companyImgMapper;
	
	// 업체 사진 수정
	public boolean modifyCompanyImg(String companyId, List<MultipartFile> comImgs, int choose, String path) {
		
		// 기존 사진을 받아온 이미지 list로 모두 변경
		for(int i=0; i<comImgs.size(); i++) {
			// 변수 선언
			String companyImgOriginName = "";
			String companyImgSaveName = "";
			String companyImgKind = "";
			int companyImgSize = 0;
			List<CompanyImg> oldFile = companyImgMapper.selectComImgList(companyId);
			MultipartFile newFile = comImgs.get(i);
			
			// 분기 : 1) n번째 사진 변경 x, n번째 사진 변경 o   
			if(newFile.isEmpty()) { // 사진을 수정하지 않았다면 기존 데이터 불러오기
				log.debug(FontColor.BLUE+(i+1)+"번째 사진 변경 x");
				companyImgOriginName = oldFile.get(i).getCompanyImgOriginName(); // 확장자포함이름
				companyImgSaveName = oldFile.get(i).getCompanyImgSaveName(); // 저장된 이름 
				companyImgKind = oldFile.get(i).getCompanyImgKind(); // 확장자
				companyImgSize = oldFile.get(i).getCompanyImgSize(); // 파일용량				
			} else { // 수정 했다면 새로운 파일 정보 받아오기
				log.debug(FontColor.BLUE+(i+1)+"번째 사진 변경 o");
				companyImgOriginName = newFile.getOriginalFilename(); // 확장자포함이름
				companyImgKind = newFile.getContentType(); // 확장자
				companyImgSize = (int)newFile.getSize(); // 파일용량
				
				// 랜덤한 파일명 생성
				String newName = UUID.randomUUID().toString().replace("-", ""); // 확장자 미포함, 랜덤 문자열 생성 시 사용하는 api
				String ext = companyImgOriginName.substring(companyImgOriginName.lastIndexOf(".")+1); // 확장자 추출
				
				companyImgSaveName = newName+"."+ext; // 새로 저장할 이름
			}
			log.debug("\u001B[32m"+"companyImgOriginName------>"+companyImgOriginName);
			log.debug("\u001B[32m"+"companyImgSaveName------>"+companyImgSaveName);
			
			// companyImg에 담기
			CompanyImg img = new CompanyImg();
			img.setCompanyId(companyId);
			img.setCompanyImgOriginName(companyImgOriginName);
			img.setCompanyImgSaveName(companyImgSaveName);
			img.setCompanyImgKind(companyImgKind);
			img.setCompanyImgSize(companyImgSize);
			img.setCompanyImgNo(oldFile.get(i).getCompanyImgNo()); // 변경할 이미지 번호
			
			// 대표사진 여부
			if(choose == -1) {
				img.setCompanyImgLevel(null);
				log.debug(FontColor.BLUE+"대표사진 변경 X");
			} else{
				if(choose == i) {
					img.setCompanyImgLevel("Y");
					log.debug(FontColor.BLUE+(i+1)+"번째 사진 대표사진으로 변경");
				} else {
					img.setCompanyImgLevel("N");
				}
			}
			
			// db 변경
			int row = companyImgMapper.updateCompanyImg(img);
			if(row == 0) {
				log.debug(FontColor.BLUE+(i+1)+"번째 사진 변경 실패");
				return false;
			}
			
			// upload 폴더 사진 수정
			if(!newFile.isEmpty()) { // 사진 변경했다면 새로운 파일 정보로 수정				
				File oldImg = new File(path+"\\"+oldFile.get(i).getCompanyImgSaveName()); // 기존 사진
				File newImg = new File(path+"\\"+companyImgSaveName); // 새로운 사진
				try {
					oldImg.delete(); // 기존 파일 삭제
					newFile.transferTo(newImg); // 새로운 사진 저장
				} catch(Exception e) {
				 	e.printStackTrace();
				 	throw new RuntimeException();
				}
			}
		}
		log.debug(FontColor.BLUE+"모든 정보 수정 성공");
		return true;
	}
	
	// 업체 사진 조회
	public List<CompanyImg> getComImgList(String id){
		return companyImgMapper.selectComImgList(id);
	}
}
