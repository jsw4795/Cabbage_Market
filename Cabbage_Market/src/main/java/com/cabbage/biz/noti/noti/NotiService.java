package com.cabbage.biz.noti.noti;

import java.util.List;
import java.util.Map;

import com.cabbage.biz.post.post.PostVO;
import com.cabbage.biz.qa.qa.QaVO;
import com.cabbage.biz.userInfo.user.UserVO;
import com.fasterxml.jackson.core.JsonProcessingException;

public interface NotiService {
	//CRUD 기능 구현 메소드 정의
	void insertNoti(NotiVO vo);
	void updateNoti(String id);
	void deleteNoti(NotiVO vo);
	NotiVO getNoti(NotiVO vo);
	List<NotiVO> getNotiList();
	
	
	List<Map<String, String>>  checkWishKeyWord(PostVO postVo);

	List<String>  checkPostWishList(PostVO postVo);

	
	int getNotiCountById(String userId);
	List<NotiVO> getNotiListById(String userId);
	
	void afterUpdatePost(PostVO vo);
	void afterInsertPost(PostVO vo);
	void afterUpdateUserOndo(UserVO vo, String sessionId);
	void afterInsertQaAnwser(QaVO vo);

}
