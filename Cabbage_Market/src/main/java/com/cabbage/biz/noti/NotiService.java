package com.cabbage.biz.noti;

import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.cabbage.biz.main.post.PostVO;

public interface NotiService {
	//CRUD 기능 구현 메소드 정의
	void insertNoti(NotiVO vo);
	void updateNoti(NotiVO vo);
	void deleteNoti(NotiVO vo);
	NotiVO getNoti(NotiVO vo);
	List<NotiVO> getNotiList();
	
	
	SseEmitter subscribe(String username, String lastEventId);
	List<Map<String, String>>  checkWishKeyWord(PostVO postVo);
//	void send(String receiver, String notificationType, Object content, NotiVO vo);
	void send(String receiver, String notificationType, Object content);

}
