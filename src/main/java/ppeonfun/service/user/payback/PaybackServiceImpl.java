package ppeonfun.service.user.payback;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import ppeonfun.dao.user.payback.PaybackDao;
import ppeonfun.dto.Member;
import ppeonfun.dto.Payback;
import ppeonfun.dto.Payment;
import ppeonfun.dto.PaymentReward;
import ppeonfun.dto.Project;
import ppeonfun.util.BankCode;

@Service("user.PaybackService")
public class PaybackServiceImpl implements PaybackService {
	private Logger logger = LoggerFactory.getLogger(PaybackServiceImpl.class);
	@Autowired private PaybackDao paybackDao;
	
	@Override
	public List<PaymentReward> listPayment(Project project, int mNo) {
		project.setmNo(mNo); //현재 로그인된 회원번호 삽입
		
		return paybackDao.selectAllPayment(project);
	}
	
	@Override
	public List<List<PaymentReward>> groupListPayment(List<PaymentReward> paymList) {
		int count=0;
		//suGroup별로 내림차순 정렬
		Collections.sort(paymList, new Comparator<PaymentReward>() { 
            @Override
            public int compare(PaymentReward p1, PaymentReward p2) {
                if (p1.getSuGroup() < p2.getSuGroup()) {
                    return 1;
                } else if (p1.getSuGroup() > p2.getSuGroup()) {
                    return -1;
                }
                return 0;
            }
        });
		
		for(int i=0; i<paymList.size(); i++) {
			logger.info("PaymentReward {}",paymList.get(i));
		}
		
		
		List<List<PaymentReward>> groupList = new ArrayList<>();
		List<PaymentReward> tempList = null;
		for(int i=0; i<paymList.size(); i+=count) {
			count =0; //0으로 초기화
			tempList = new ArrayList<>();
			for(int j=i; j<paymList.size(); j++) {
				if(paymList.get(i).getSuGroup() == paymList.get(j).getSuGroup()) {
					tempList.add(paymList.get(j)); // 같은 그룹일때 PaymentReward 저장
					count++; //PaymentReward값이 증가할때마다 count 증가
				}
			}
			groupList.add(tempList); //삽입
		}
		//출력
		for(int i=0; i<groupList.size(); i++) {
			for(int j=0; j<groupList.get(i).size(); j++) {
				logger.info("groupValue {}", groupList.get(i).get(j));
			}
			logger.info("\n");
		}
		
		return groupList;
	}
	@Override
	public String getToken() {
		HttpURLConnection conn=null;
		URL url;
		StringBuilder sb=null;
		try {
			url = new URL("https://api.iamport.kr/users/getToken");//엑세스할 토큰을 받아올 주소 입력
			conn = (HttpURLConnection)url.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Accept", "application/json");
			
			//Data설정
			conn.setDoOutput(true); //OutputStream으로 POST 데이터를 넘겨주겠다는 옵션
			JsonObject obj = new JsonObject();
			
			obj.addProperty("imp_key", "9081765440266501");
			obj.addProperty("imp_secret", "DdLtVjTUlJ47lCyLGOsnmwycGAlfngk0u6uqpnkK7oSs0qeHfG5BdDNTd99BqtBVA6m0tGLB5D364hOj");
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			bw.write(obj.toString());
			bw.flush();
			bw.close();
			
			int responseCode = conn.getResponseCode(); //응답코드 받기
			logger.info("응답코드 : {}",responseCode);
			
			
			if(responseCode==200) {//성공
				logger.info("토큰 발급 성공");
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				
				sb = new StringBuilder();
				String line = null;
				while((line=br.readLine())!=null) {
					sb.append(line+"\n");
				}
				br.close();
				
				
			}else {
				logger.info("message: {}", conn.getResponseMessage());
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		String  token= sb.toString(); //발급된 통근 반환
		logger.info("token : {}", token);
		
		
		return token;
	}
	
	@Override
	public void paybackProc(String token, String[] suGroup, int mNo) {
		int responseCode; //응답 코드
		URL url;
		try {
			
			
			Member member = paybackDao.selectMember(mNo);
			BankCode bankCode = new BankCode();
			HashMap<String, String> codeTable = (HashMap<String, String>) bankCode.getCodeTable();
			
			for(int i=0; i<suGroup.length; i++) {
				url = new URL("https://api.iamport.kr/payments/cancel");//환불 주소
				HttpURLConnection conn = (HttpURLConnection)url.openConnection();
				JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(token);
				JsonObject jsonObject = element.getAsJsonObject();
				JsonObject response = jsonObject.get("response").getAsJsonObject();
				
				String access_token = response.getAsJsonObject().get("access_token").getAsString();
				StringBuilder sb = new StringBuilder();
				
				conn.setRequestMethod("POST");
				conn.setRequestProperty("Content-Type", "application/json"); //header 설정
				conn.setRequestProperty("Authorization", access_token); //header 설정
				conn.setRequestProperty("Accept", "application/json");
				conn.setDoOutput(true); //OutputStream으로 POST 데이터를 넘겨주겠다는 옵션
				BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
				
				List<Payment> paymList = paybackDao.selectPayment(Integer.parseInt(suGroup[i]));
				JsonObject obj = new JsonObject();
				int amount=0;
				Payback payback = null;
				String impUid="";
				for(int j=0; j<paymList.size(); j++) {
					payback = new Payback();
					payback.setPaybAmount(paymList.get(j).getPaymAmount());
					payback.setPaybChecksum(0);
					payback.setPaybTaxFree(0);
					payback.setPaybReason("펀딩 취소");
					payback.setPaybRefundHolder(member.getmName());
					payback.setPaybRefundAccount(member.getmAccount());
					payback.setPaybRefundBank(codeTable.get(member.getmBank()));
					payback.setPaymNo(paymList.get(i).getPaymNo());
					paybackDao.updatePaymentState(paymList.get(j));
					paybackDao.insertPayback(payback); //payback 데이터 삽입
					amount+= paymList.get(j).getPaymAmount();
					impUid = paymList.get(j).getPaymImpUid(); //impuid 저장
				}
				obj.addProperty("imp_uid", impUid);
				obj.addProperty("amount", amount);
				obj.addProperty("checksum",amount);
				obj.addProperty("reason",payback.getPaybReason());
				obj.addProperty("refund_holder",payback.getPaybRefundHolder());
				obj.addProperty("refund_bank",payback.getPaybRefundBank());
				obj.addProperty("refund_account",payback.getPaybRefundAccount());
				
				bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
				bw.write(obj.toString());
				bw.flush();
				bw.close();
			    
				
				responseCode = conn.getResponseCode(); //응답코드 받기
				logger.info("응답코드 : {}",responseCode);
				
				if(responseCode==200) {
					logger.info("응답성공!!");
					BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
					
					sb = new StringBuilder();
					String line = null;
					while((line=br.readLine())!=null) {
						sb.append(line+"\n");
					}
					br.close();
					logger.info("{}",sb.toString());
					element = parser.parse(sb.toString());
					jsonObject = element.getAsJsonObject();
					//메시지가 있을때 출력
					if(!jsonObject.has("message")) { //메시지가 null이 아닐때
						String message = element.getAsJsonObject().get("message").getAsString();
						logger.info("message:{}",message);
					}
				}else {
					logger.info(conn.getResponseMessage());
				}
				
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 

	}
	@Override
	public void removeSupporter(String[] suGroup) {
		for(int i=0; i<suGroup.length; i++) {
			paybackDao.deleteSupoorter(Integer.parseInt(suGroup[i]));
		}
		
	}
}
