package com.cabbage.biz.noti.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.cabbage.biz.main.post.PostVO;
import com.cabbage.biz.noti.NotiService;
import com.cabbage.biz.noti.NotiVO;
import com.cabbage.biz.noti.SseEmitters;

@Service
public class NotiServiceImpl implements NotiService {
	private static final Long DEFAULT_TIMEOUT = 60L * 1000 * 60;
    // SSE 연결 지속 시간 설정
	@Autowired 
	private SseEmitters emitterRepository;
    
	@Autowired //타입이 일치하는 객체(인스턴스) 주입
	private NotiDAO notiDAO;
	 
    private static Map<String, Integer> notificationCounts = new HashMap<>();     // 알림 개수 저장

	@Autowired
	public NotiServiceImpl(SseEmitters emitterRepository, NotiDAO notiDAO) { 
		System.out.println(">> NotiServiceImpl() 객체 생성");
		this.emitterRepository = emitterRepository;
        this.notiDAO = notiDAO;

	}
	
	// [1] subscribe()
    public SseEmitter subscribe(String userId, String lastEventId) { 
    	// (1-1)
    	String emitterId = userId + "_" + System.currentTimeMillis();
        // (1-2)
        SseEmitter emitter = emitterRepository.save(emitterId, new SseEmitter(DEFAULT_TIMEOUT)); // (1-3)
        // (1-4)
        emitter.onCompletion(() -> emitterRepository.deleteById(emitterId));
        emitter.onTimeout(() -> emitterRepository.deleteById(emitterId));

        // (1-5) 503 에러를 방지하기 위한 더미 이벤트 전송
        sendNotification(emitter, emitterId, "EventStream 성공공공공공고노라ㅓㄴ어라나");
        
        // (1-6) 클라이언트가 미수신한 Event 목록이 존재할 경우 전송하여 Event 유실을 예방
        if (!lastEventId.isEmpty()) {
            Map<String, Object> events = emitterRepository.findAllEventCacheStartWithId(String.valueOf(userId));
            events.entrySet().stream()
                  .filter(entry -> lastEventId.compareTo(entry.getKey()) < 0)
                  .forEach(entry -> sendNotification(emitter, entry.getKey(), entry.getValue()));
        }
        return emitter; // (1-7)
    }
    
    //더미 데이터 전송 메소드
    private void sendNotification(SseEmitter emitter, String emitterId, Object data) { // (4)
        try {
            emitter.send(SseEmitter.event()
                    .id(emitterId)
                    .name("ssee")
                    .data(data)
            );
        } catch (IOException exception) {
            emitterRepository.deleteById(emitterId);
            throw new RuntimeException("연결 오류!");
        }
    }
    
    //알림 보내기
    public void send(String wishUserId, String notificationType, Object content) {
    	System.out.println("여기는 노티서비스임플 : 샌드 메소드");
    	
    	Map<String, SseEmitter> emitters = emitterRepository.findAllEmitterStartWithId(wishUserId); // (2-4)
        emitters.forEach( // (2-5)
            (key, emitter) -> {
//                emitterRepository.saveEventCache(key, vo.getNotiId());
//                sendNotification(emitter, key, NotiVO.Response.createResponse(notification));
                if (emitter != null) {
                    try {
                        emitter.send(SseEmitter.event()
                        		.id(key)
                        		.name("sse").data(content));
                        
//                        // 알림 개수 증가
//                        notificationCounts.put(wishUserId, notificationCounts.getOrDefault(wishUserId, 0) + 1);
//
//                        // 현재 알림 개수 전송
//                        emitter.send(SseEmitter.event().name("notificationCount").data(notificationCounts.get(wishUserId)));

                    } catch (IOException exception) {
                        emitterRepository.deleteById(key);
                        emitter.completeWithError(exception);
                    }
                }
            }
        );
        
    }
 
    
//    private boolean hasLostData(String lastEventId) { // (5)
//        return !lastEventId.isEmpty();
//    }
//    
//    private void sendLostData(String lastEventId, String userEmail, String emitterId, SseEmitter emitter) { // (6)
//        Map<String, Object> eventCaches = emitterRepository.findAllEventCacheStartWithByMemberId(String.valueOf(userEmail));
//        eventCaches.entrySet().stream()
//                .filter(entry -> lastEventId.compareTo(entry.getKey()) < 0)
//                .forEach(entry -> sendNotification(emitter, entry.getKey(), emitterId, entry.getValue()));
//    }
    /////////////////////////////////////////
    // [2] send()
    

    
    public List<Map<String, String>>  checkWishKeyWord(PostVO postVo) {
    	return notiDAO.checkWishKeyWord(postVo);
    }
    
	@Override
	public void insertNoti(NotiVO vo) {
		notiDAO.insertNoti(vo);
	}

	@Override
	public void updateNoti(NotiVO vo) {
		notiDAO.updateNoti(vo);
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
