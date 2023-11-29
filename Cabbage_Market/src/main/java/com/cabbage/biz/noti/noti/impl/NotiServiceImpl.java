package com.cabbage.biz.noti.noti.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cabbage.biz.noti.noti.NotiService;
import com.cabbage.biz.noti.noti.NotiVO;
import com.cabbage.biz.post.post.PostVO;
import com.cabbage.biz.qa.qa.QaVO;
import com.cabbage.biz.userInfo.user.UserVO;
import com.fasterxml.jackson.core.JsonProcessingException;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service("notiService")
public class NotiServiceImpl implements NotiService {
    
	private final NotiDAO notiDAO;
    
    
    @Override
   	public void afterInsertPost(PostVO vo) throws JsonProcessingException {
    	List<Map<String, String>>  a = checkWishKeyWord(vo);
		

		if (a != null) {
			for (Map<String, String> row : a) {
			    String wishUserId = row.get("USER_ID");
			    String wishKeyword = row.get("WISH_KEYWORD");
			    String b = wishKeyword + " - " + vo.getPostTitle();
			    String url = "/post/getPost/" + vo.getPostId();
			    NotiVO voN = new NotiVO();
			    voN.setUserId(wishUserId);
				voN.setPostId(vo.getPostId());
				voN.setNotiType("키워드");
				voN.setNotiContent(b);
				voN.setNotiUrl(url);
		    	
		    	//노티 테이블 insert
		    	insertNoti(voN);

			}
		}
   		
   	}
    
    @Override
	public void afterUpdatePost(PostVO vo) throws JsonProcessingException {
    	List<String>  a = checkPostWishList(vo);

		for (String wishUserId : a) {
		    String b = vo.getSellerId() + "님이 " 
		    			+ vo.getPostTitle() + "의 가격이 변동되었어요. ";
		    String url = "/post/getPost/" + vo.getPostId();
		    NotiVO voN = new NotiVO();
		    voN.setUserId(wishUserId);
			voN.setPostId(vo.getPostId());
			voN.setNotiType("가격 할인");
			voN.setNotiContent(b);
			voN.setNotiUrl(url);
			
	    	insertNoti(voN);

		}
		
	}
    
	@Override
	public void afterUpdateUserOndo(UserVO vo, String buyerId) throws JsonProcessingException {
		// vo.getUserOndo해서 몇도로 변경됐는지...
		String b = buyerId + "님이 거래 후기를 남겨서 온도가 변화됐어요.";
		String url = "/user/myInfo";
	    NotiVO voN = new NotiVO();
	    String sellerId = "test1";
		voN.setUserId(sellerId);
		voN.setNotiType("온도 변경");
		voN.setNotiContent(b);
		voN.setNotiUrl(url);
		
    	insertNoti(voN);
	}

	@Override
	public void afterInsertQaAnwser(QaVO vo) throws JsonProcessingException {
		String b = "문의하신 " + vo.getQaTitle() + "에 대한 답변이 등록되었습니다.";
		String url = "/qa/qaFormDetail?qa_id=" + vo.getQaId();
				
		NotiVO voN = new NotiVO();

		voN.setUserId(vo.getUserId());
		voN.setUserId("test1");
		voN.setQaId(vo.getQaId());
		voN.setQaId(100);
		voN.setNotiType("문의글 답변");
		voN.setNotiContent(b);
		voN.setNotiUrl(url);
		
    	insertNoti(voN);

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
