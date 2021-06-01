package ppeonfun.service.user.member;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Random;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import ppeonfun.dao.user.member.MemberDao;
import ppeonfun.dto.Member;
import ppeonfun.util.Encryption;

@Service("user.MemberService")
public class MemberServiceImpl implements MemberService {
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	
	@Autowired private JavaMailSender mailSender;
	@Autowired private MemberDao memberDao;
	@Override
	public Member encryption(Member member) {
		logger.info("암호화 실행");
		Encryption encryption = new Encryption();
		String enc=encryption.encryption(member.getmPassword());
		member.setmPassword(enc);
		
		return member;
	}
	
	@Override
	public Member login(Member member) {
		logger.info("로그인 실행");
		Member result=memberDao.selectLogin(member);
		logger.info("result: {}", result);
		
		return result;
	}
	@Override
	public String sendAuthMail(String email) {
		String authKey = getAuthCode(6);
		logger.info("난수 {}", authKey);
        //인증메일 보내기
		try{
	        MimeMessage msg = mailSender.createMimeMessage();

	        InternetAddress addr = new InternetAddress("tarot1415@gmail.com");

	        msg.setFrom(addr); // 송신자를 설정해도 소용없지만 없으면 오류가 발생한다

	        //msg.setFrom("someone@paran.com");

	        msg.setSubject("인증 내역");
	        //HTML 컨텐츠를 전송하려면. http://micropilot.tistory.com/category/Java%20Mail/HTML%20Contents
	        msg.setContent("<p>"+authKey+"</p>", "text/html;charset=utf-8");
	        msg.setRecipient(RecipientType.TO , new InternetAddress(email));
	        mailSender.send(msg);
        }catch(Exception ex) {
        	ex.printStackTrace();
        }

          return authKey;
	}
	
	@Override
	public boolean idCheck(Member member) {
		
		if(memberDao.selectIdCheck(member) > 0) { //아이디 존재
			return false;
		}else { //아이디 존재 하지 않음
			return true;
		}
	
	}
	
	@Override
	public boolean nickCheck(Member member) {
		if(memberDao.selectNickCheck(member) > 0) { //아이디 존재
			return false;
		}else { //아이디 존재 하지 않음
			return true;
		}
	}

    //인증코드 난수 발생
    private String getAuthCode(int size) {
        Random random = new Random();
        StringBuffer buffer = new StringBuffer();
        while(buffer.length() < size) {
        	buffer.append(random.nextInt(10));
        }
        
        return buffer.toString();
    }
    
    @Override
    public Member join(Member member) {
    	member.setmDeleteState("N");
    	member.setmGrade("U");
    	member.setmSocial("사이트");
    	memberDao.insertMember(member);
    	return member;
    }
    
    @Override
    public Member joinKakao(HashMap<String, Object> userInfo) {
    	Member member = new Member();
    	member.setmDeleteState("N");
    	member.setmGrade("U");
    	member.setmSocial("kakao");
    	member.setmName(String.valueOf(userInfo.get("nickname")));
    	member.setmNick(String.valueOf(userInfo.get("id"))+String.valueOf(userInfo.get("nickname")));
    	member.setmEmail(String.valueOf(userInfo.get("email")));
    	member.setmId(String.valueOf(userInfo.get("email")));
    	if(String.valueOf(userInfo.get("gender")).equals("male")) {
    		member.setmGender("M");
    	}else {
    		member.setmGender("F");
    	}
    	memberDao.insertKakaMember(member);
    	
    	return member;
    }
    
    @Override
    public String kakaoGetAccessToken(String authoriz_code) {
    	String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";
        
        try {
        	logger.info("카카오 토큰 가져오기");
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
            //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            
            //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=684fd291495baa02477d2ce31d0e378b");
            sb.append("&redirect_uri=http://localhost:8088/user/member/kakao/login");
            sb.append("&code=" + authoriz_code);
            bw.write(sb.toString());
            bw.flush();
            
            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            logger.info("responseCode: {}", responseCode);
            
            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            logger.info("response body : {}", result);
            
            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
           
            logger.info("access_token : {}", access_Token);
            logger.info("refresh_token : {}", refresh_Token );
            
            
            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
        
        return access_Token;
    }
    @Override
    public HashMap<String, Object> getUserInfo(String accessToken) {
//      요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
        	logger.info("유저 정보 가져오기");
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            
            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);
            
            int responseCode = conn.getResponseCode();
            logger.info("responseCode : {}",responseCode);
            
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            logger.info("response body : {}", result);
            
            
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
            
            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();
            String gender = kakao_account.getAsJsonObject().get("gender").getAsString();
            String id = element.getAsJsonObject().get("id").getAsString();
            
            userInfo.put("nickname", nickname);
            userInfo.put("email", email);
            userInfo.put("gender", gender);
            userInfo.put("id", id);
            
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return userInfo;
    }

	@Override
    public void kakaoLogout(String accessToken) {
        String reqURL = "https://kapi.kakao.com/v1/user/logout?client_id=684fd291495baa02477d2ce31d0e378b&logout_redirect_uri=http://localhost:8088/user/member/kakao/logout";
        try {
        	logger.info("카카오 로그아웃");
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);
            
            int responseCode = conn.getResponseCode();
            logger.info("responseCode : {}"+ responseCode);
            
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            
            String result = "";
            String line = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            logger.info("result : {}", result);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
	@Override
	public void kakaoUnlink(String accessToken) {
		String reqURL = "https://kapi.kakao.com/v1/user/unlink";
        try {
        	logger.info("카카오 연결 끊기");
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);
            
            int responseCode = conn.getResponseCode();
            logger.info("responseCode : {}"+ responseCode);
            
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            
            String result = "";
            String line = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            logger.info("result : {}", result);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
	}
	
	
	@Override
	public String kakaoGetAuthorize() {
		String reqURL = "https://kauth.kakao.com/oauth/authorize?client_id=684fd291495baa02477d2ce31d0e378b&redirect_uri=http://localhost:8088/user/member/kakao/login&response_type=code";
		String line = "";
        String result = "";
		try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            
            int responseCode = conn.getResponseCode();
            logger.info("responseCode : {}",responseCode);
            
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            
           
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            logger.info("response body : {}", result);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		
		return result;
	}
	
	@Override
	public boolean kakaoIdCheck(String email) {
		if(memberDao.selectKaKaoIdCheck(email) >0) {
			return true; //아이디 존재
		}
		return false; //아이디 존재 하지 않음
	}
	@Override
	public int kakaoMno(String email) {
		return memberDao.selectKakaoMno(email);
	}
	
	@Override
	public String idFind(String mEmail) {
		return memberDao.selectId(mEmail);
	}
    
}
