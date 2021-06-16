package ppeonfun.dao.user.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import ppeonfun.dto.Board;
import ppeonfun.dto.CommunityAnswer;
import ppeonfun.dto.Member;
import ppeonfun.dto.Message;
import ppeonfun.dto.MyPage;
import ppeonfun.util.Paging;

@Repository("user.MypageDao")
public interface MypageDao {

	/**
	 * 회원번호로 mypage 테이블을 조회한다.
	 * @param mNo	회원번호
	 * @return		프로필 정보가 담긴 DTO
	 */
	public MyPage selectMypageBymNo(int mNo);

	
	/**
	 * 회원의 프로필 정보를 수정한다.
	 * @param mypage	프로필 정보가 담긴 DTO
	 */
	public void updateMypage(MyPage mypage);


	/**
	 * 회원의 소개 글을 수정한다.
	 * @param mypage	소개글 데이터가 담긴 DTO
	 */
	public void updateMypageIntro(MyPage mypage);


	/**
	 * 회원번호로 회원 정보를 조회한다.
	 * @param mNo	회원번호
	 * @return		회원 정보가 담긴 DTO
	 */
	public Member selectMemberByNo(int mNo);


	/**
	 * 회원 정보를 수정한다.
	 * @param member	회원 기본 정보가 담긴 DTO
	 */
	public void updateMemberInfo(Member member);


	/**
	 * member 테이블의 social을 조회한다.
	 * @param mNo	회원번호
	 * @return		social
	 */
	public String selectMsocialByNo(int mNo);


	/**
	 * 입력값과 일치하는 데이터 행을 조회한다.
	 * @param member	비밀번호 입력값이 담긴 DTO
	 * @return			일치하는 행의 수
	 */
	public int selectCntmPw(Member member);


	/**
	 * member 테이블의 m_password를 수정한다.
	 * @param member	새 비밀번호가 담긴 DTO
	 */
	public void updatePwByNo(Member member);


	/**
	 * 회원번호로 member 테이블의 m_email을 조회한다.
	 * @param mNo	회원번호
	 * @return		m_email
	 */
	public String selectmEmailBymNo(int mNo);

	
	/**
	 * payment, project 테이블을 조인하여
	 * 회원이 서포터로서 참여한 프로젝트 수를 조회한다.
	 * 
	 * @param mNo	회원번호
	 * @return		참여중인 프로젝트 개수
	 */
	public int selectCntProjectBySupport(int mNo);
	
	/**
	 * project 테이블에서 회원이 메이커로서 참여한 프로젝트 수를 조회한다.
	 * 
	 * @param mNo	회원번호
	 * @return		참여중인 프로젝트 개수
	 */
	public int selectCntProjectByMaker(int mNo);

	
	/**
	 * member 테이블의 m_delete_state를 업데이트한다.
	 * @param mNo	회원 탈퇴를 신청한 회원번호
	 */
	public void updateDeleteStateBymNo(int mNo);


	/**
	 * 회원이 펀딩한 전체 내역을 조회한다.
	 * @param mNo			회원번호
	 * @param categoryArr	카테고리 목록
	 * @return				전체 내역 수
	 */
	public int selectCntPayment(@Param("mNo")int mNo, @Param("categoryArr")String[] categoryArr);

	
	/**
	 *  payment, project, information 테이블을 조인하여
	 *  회원이 펀딩한 프로젝트 전체 목록을 조회한다. (페이징 적용)
	 * @param paging		페이징 정보
	 * @param mNo			회원번호
	 * @param categoryArr	카테고리 목록
	 * @return				펀딩한 프로젝트 목록
	 */
	public List<Map<String, Object>> selectMyFundingListAll(@Param("paging")Paging paging, @Param("mNo")int mNo, @Param("categoryArr") String[] categoryArr);


	/**
	 * payment와 information 테이블을 조인하여
	 * i_category 별 회원의 결제 완료 금액을 조회한다.
	 * @param mNo	회원번호
	 * @return		카테고리별 결제 완료 금액
	 */
	public List<HashMap<String, Object>> selectPaymSumByNo(int mNo);


	/**
	 * payment, payback, information 테이블을 조인하여
	 * i_category 별 회원의 환불 금액을 조회한다.
	 * @param mNo	회원번호
	 * @return		카테고리별 환불 금액
	 */
	public List<HashMap<String, Object>> selectPaybSumByNo(int mNo);

	
	/**
	 * 회원이 좋아요한 프로젝트 수를 조회한다.
	 * @param mNo	회원번호
	 * @return		좋아요 한 프로젝트 수
	 */
	public int selectCntFavorite(int mNo);
	
	
	/**
	 * favorite, project, information 테이블을 조인하여
	 * 회원이 좋아요 한 프로젝트 목록을 조회한다.
	 * 
	 * @param paging	페이징 정보 객체
	 * @param mNo		회원번호
	 * @return			좋아한 프로젝트 목록
	 */
	public List<HashMap<String, Object>> selectAllMyFavoriteList(@Param("paging")Paging paging, @Param("mNo")int mNo);


	/**
	 * 회원이 펀딩 커뮤니티에 작성한 글의 수를 조회한다.
	 * @param mNo	회원번호
	 * @return		작성한 글 수
	 */
	public int selectCntFundComm(int mNo);


	/**
	 * community, project 테이블을 조인하여
	 * 회원이 작성한 글 목록을 조회한다.
	 * 
	 * @param paging 	페이징 정보 객체
	 * @param mNo		회원번호
	 * @return			작성한 글 목록
	 */
	public List<HashMap<String, Object>> selectAllMyFundCommList(@Param("paging")Paging paging, @Param("mNo")int mNo);


	/**
	 * community, community_ans 테이블을 조인하여
	 * 회원이 작성한 글의 답변을 조회한다.
	 * 
	 * @param mNo		회원번호
	 * @param comNo		커뮤니티 질문 번호
	 * @return			답변 DTO
	 */
	public CommunityAnswer selectCommAnsBycomNo(@Param("mNo")int mNo, @Param("comNo")int comNo);


	/**
	 * 회원이 작성한 게시글의 수를 조회한다.
	 * @param mNo	회원번호
	 * @return		게시글 수
	 */
	public int selectCntMyBoard(int mNo);


	/**
	 * board 테이블에서 회원이 작성한 게시글을 조회한다.
	 * @param paging	페이징 정보 객체
	 * @param mNo		회원번호
	 * @return			게시글 목록
	 */
	public List<HashMap<String, Object>> selectAllBoardBymNo(@Param("paging")Paging paging, @Param("mNo")int mNo);


	/**
	 * 회원이 참여중인 채팅방의 수를 조회한다.
	 * @param mNo	회원번호
	 * @return		채팅방 수
	 */
	public int selectCntChatBymNo(int mNo);


	/**
	 * 회원이 참여중인 채팅방 번호를 조회한다.
	 * @param mNo	회원번호
	 * @return		채팅방 번호 목록
	 */
	public List<Integer> selectChatNoBymNo(int mNo);


	/**
	 * chat_participant, chat_room, mypage, member 테이블을 조인하여
	 * 대화 목록을 조회한다.(상대방 정보 포함)
	 * @param paging		페이징 정보 객체
	 * @param chatNoList	채팅방 번호
	 * @param mNo			회원 번호
	 * @return				대화 목록
	 */
	public List<HashMap<String, Object>> selectAllMyChatList(@Param("paging")Paging paging, @Param("chatNoList")List<Integer> chatNoList, @Param("mNo")int mNo);


	/**
	 * message, chat_participant, member 테이블을 조인하여
	 * 대화방의 최근 메시지를 조회한다.
	 * @param integer	대화방 번호
	 * @return			최근 메시지
	 */
	public HashMap<String, Object> selectMessageBycrNo(@Param("crNo")Integer chatRoomNo);


	/**
	 * message, chat_participant, member, chat_room 테이블을 조인하여
	 * 해당 대화방의 모든 메시지를 조회한다.
	 * @param crNo 	대화방 번호
	 * @return		대화 상세 내용(모든 메시지)
	 */
	public List<HashMap<String, Object>> selectAllMessageContent(int crNo);


}
