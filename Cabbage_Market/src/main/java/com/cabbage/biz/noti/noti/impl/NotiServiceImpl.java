package com.cabbage.biz.noti.noti.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cabbage.biz.main.post.PostVO;
import com.cabbage.biz.noti.noti.NotiService;
import com.cabbage.biz.noti.noti.NotiVO;
import com.cabbage.biz.qa.qa.QaVO;
import com.cabbage.biz.userInfo.user.UserVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service("notiService")
public class NotiServiceImpl implements NotiService {
    
	private final NotiDAO notiDAO;
    
    
    @Override
   	public void afterInsertPost(PostVO vo) throws JsonProcessingException {
    	List<Map<String, String>>  a = checkWishKeyWord(vo);
		
    	System.out.println("-----------------------------------------------");

		if (a != null) {
			for (Map<String, String> row : a) {
			    String wishUserId = row.get("USER_ID");
			    String wishKeyword = row.get("WISH_KEYWORD");
			    String b = wishKeyword + " - " + vo.getPostTitle();
			    String url = "/post/getpost/" + vo.getPostId();
			    System.out.println("wishUserId: " + wishUserId + ", Wish Keyword: " + wishKeyword);
			    NotiVO voN = new NotiVO();
			    voN.setUserId(wishUserId);
				voN.setPostId(vo.getPostId());
				voN.setNotiType("키워드");
				voN.setNotiContent(b);
				voN.setNotiUrl(url);
		    	
		    	//노티 테이블 insert
		    	insertNoti(voN);
		    	
		    	// Map을 생성하고 데이터를 추가하는 부분을 한 줄로 간소화
		    	Map<String, Object> data = new HashMap<>();
		    	data.put("url", url);
		    	data.put("message", "<b style='font-size:18px;'>[키워드 알림]</b><br><br> " +b);
		    	data.put("img", "<b style='font-size:18px;'>[키워드 알림]</b><br><br> " +b);

		    	// JSON 형식으로 변환하는 부분을 한 줄로 간소화
		    	String jsonData = new ObjectMapper().writeValueAsString(data);

			}
		}
   		
   	}
    
    @Override
	public void afterUpdatePost(PostVO vo) throws JsonProcessingException {
    	List<String>  a = checkPostWishList(vo);

		for (String wishUserId : a) {
		    System.out.println(wishUserId);
		    String b = vo.getSellerId() + "님이 " 
		    			+ vo.getPostTitle() + "의 가격 할인을 제안했어요. ";
		    String url = "/post/getpost/" + vo.getPostId();
		    NotiVO voN = new NotiVO();
		    voN.setUserId(wishUserId);
			voN.setPostId(vo.getPostId());
			voN.setNotiType("가격 할인");
			voN.setNotiContent(b);
			voN.setNotiUrl(url);
			
	    	insertNoti(voN);
	    	
	    	// Map을 생성하고 데이터를 추가하는 부분을 한 줄로 간소화
	    	Map<String, Object> data = new HashMap<>();
	    	data.put("url", url);
	    	data.put("message", "<b style='font-size:18px;'>[가격 할인 알림]</b><br><br>" + b);

	    	// JSON 형식으로 변환하는 부분을 한 줄로 간소화
	    	String jsonData = new ObjectMapper().writeValueAsString(data);


		}
		
	}
    
	@Override
	public void afterUpdateUserOndo(UserVO vo, String sessionId) throws JsonProcessingException {
		// vo.getUserOndo해서 몇도로 변경됐는지...
		String b = sessionId + "님이 거래 후 온도 뭐라고 해야하니 ㅋ";
		String url = "/user/myInfo";
	    NotiVO voN = new NotiVO();
	    String sellerId = "test1";
		voN.setUserId(sellerId);
		voN.setNotiType("온도 변경");
		voN.setNotiContent(b);
		voN.setNotiUrl(url);
		
    	insertNoti(voN);

    	// Map을 생성하고 데이터를 추가하는 부분을 한 줄로 간소화
    	Map<String, Object> data = new HashMap<>();
    	data.put("url", url);
    	data.put("message", "<b style='font-size:18px;'>[온도 변경 알림]</b><br><br>" + b);

    	// JSON 형식으로 변환하는 부분을 한 줄로 간소화
    	String jsonData = new ObjectMapper().writeValueAsString(data);

		
	}

	@Override
	public void afterInsertQaQnwser(QaVO vo) throws JsonProcessingException {
		String b = "문의하신 " + "vo.getQaTitle()" + "에 대한 답변이 등록되었습니다.";
		String url = "/qa/qaformdetail?qa_id=" + "vo.getQaId()";
				
		NotiVO voN = new NotiVO();

//		voN.setUserId("vo.getUserId()");
		voN.setUserId("test1");
//		voN.setQaId("vo.getQaId()");
		voN.setQaId(100);
		voN.setNotiType("문의글 답변");
		voN.setNotiContent(b);
		voN.setNotiUrl(url);
		
    	insertNoti(voN);

    	// Map을 생성하고 데이터를 추가하는 부분을 한 줄로 간소화
    	Map<String, Object> data = new HashMap<>();
    	data.put("url", url);
    	data.put("message", "<b style='font-size:18px;'>[문의글 답변 알림]</b><br><br>" 
    				+ b);

    	// JSON 형식으로 변환하는 부분을 한 줄로 간소화
    	String jsonData = new ObjectMapper().writeValueAsString(data);

	}

	public List<String>  checkPostWishList(PostVO postVo) {
    	return notiDAO.checkPostWishList(postVo);
    }
    
	public List<Map<String, String>>  checkWishKeyWord(PostVO postVo) {
    	return notiDAO.checkWishKeyWord(postVo);
    }
    
	@Override
	public int getNotiCountById(String userId) {
		return notiDAO.getNotiCountById(userId);
	}
	
	@Override
	public List<NotiVO> getNotiListById(String userId) {
		return notiDAO.getNotiListById(userId);
	}

	@Override
	public void insertNoti(NotiVO vo) {
		notiDAO.insertNoti(vo);
	}

	@Override
	public void updateNoti(String id) {
		notiDAO.updateNoti(id);
	}

	@Override
	public void deleteNoti(NotiVO vo) {
		notiDAO.deleteNoti(vo);
	}

	@Override
	public NotiVO getNoti(NotiVO vo) {
		return notiDAO.getNoti(vo);
	}

	@Override
	public List<NotiVO> getNotiList() {
		return  notiDAO.getNotiList();
	}

	
	
}
