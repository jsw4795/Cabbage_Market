package com.cabbage.biz.noti;

import java.io.IOException;
import java.lang.reflect.Member;
import java.util.Collection;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@Repository
public class SseEmitters {
	private final Map<String, SseEmitter> emitters = new ConcurrentHashMap<>();  
	private final Map<String, Object> eventCache = new ConcurrentHashMap<>();

	//https://velog.io/@wnguswn7/Project-SseEmitter%EB%A1%9C-%EC%95%8C%EB%A6%BC-%EA%B8%B0%EB%8A%A5-%EA%B5%AC%ED%98%84%ED%95%98%EA%B8%B0
    // 에미터 저장
    public SseEmitter save(String emitterId, SseEmitter sseEmitter) { // emitter를 저장
        emitters.put(emitterId, sseEmitter);
        return sseEmitter;
    }
    
    // 에미터 삭제
    public void deleteById(String id) { // emitter를 지움
        emitters.remove(id);
    }
    
    // 해당 회원관 관련된 모든 이벤트 찾기
    public Map<String, Object> findAllEventCacheStartWithId(String userId) {
        return eventCache.entrySet().stream()
                .filter(entry -> entry.getKey().startsWith(userId))
                .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
    }
    
    // 해당 회원과 관련된 모든 에미터 찾기
    public Map<String, SseEmitter> findAllEmitterStartWithId(String userId) { // 해당 회원과 관련된 모든 이벤트를 찾음
        return emitters.entrySet().stream()
                .filter(entry -> entry.getKey().startsWith(String.valueOf(userId)))
                .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
    }
    
    // 이벤트 저장
    public void saveEventCache(String eventCacheId, Object event) { // 이벤트를 저장
        eventCache.put(eventCacheId, event);
    }
    
    
    
    public void test() {  
    	System.out.println(emitters);

    	
    	Collection<SseEmitter> emitterCollection = emitters.values();

        // 반복문을 사용하여 각 SseEmitter에 데이터를 전송
        for (SseEmitter emitter : emitterCollection) {
            try {
                emitter.send(SseEmitter.event()
                        .name("sse")
                        .data("xptmx테스트트트트"));
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

    }  
    
	public SseEmitter add(String id, SseEmitter emitter) {  
    	Random random = new Random();
        int randomValue = random.nextInt(100); // 0부터 99까지의 랜덤한 숫자를 얻음

        this.emitters.put(id + randomValue, emitter);
        System.out.println("사이즈쳌" + emitters.size());
        emitter.onCompletion(() -> {   
            this.emitters.remove(id + randomValue);    // 만료되면 리스트에서 삭제
        });  
        emitter.onTimeout(() -> {  
            emitter.complete();  
        });  
  
        return emitter;  
    }  
	
    // 해당 회원과 관련된 모든 에미터 삭제
    public void deleteAllEmitterStartWithId(String memberId) { // 해당 회원과 관련된 모든 emitter를 지움
        emitters.forEach(
                (key, emitter) -> {
                   if (key.startsWith(memberId)) {
                      emitters.remove(key);
                   }
                }
        );
    }
    
    // 해당 회원과 관련된 모든 이벤트 삭제
    public void deleteAllEventCacheStartWithId(String memberId) { // 해당 회원과 관련된 모든 이벤트를 지움
        eventCache.forEach(
                (key, emitter) -> {
                   if (key.startsWith(memberId)) {
                      eventCache.remove(key);
                   }
                }
        );
    }
}
