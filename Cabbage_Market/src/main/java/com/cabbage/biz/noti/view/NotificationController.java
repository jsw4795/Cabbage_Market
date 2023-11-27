package com.cabbage.biz.noti.view;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cabbage.biz.main.post.PostService;
import com.cabbage.biz.main.post.PostVO;
import com.cabbage.biz.noti.NotiService;
import com.cabbage.biz.noti.NotiVO;
import com.cabbage.biz.noti.SseEmitters;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class NotificationController {
	
	@Autowired
	private final NotiService notiService;
	@Qualifier("mainPostService")
	@Autowired
	private final PostService postService;
	@Autowired
	private final SseEmitters sseEmitters;  
	
	
	
	@GetMapping(value = "/connect", produces = "text/event-stream")  
    public SseEmitter connect(HttpSession session,
    							@RequestHeader(value = "Last-Event-ID", required = false, defaultValue = "") String lastEventId) {  
        String id = (session.getAttribute("userId")).toString();
        return notiService.subscribe(id, lastEventId);  
	}  
	 
	
	//여기부터는 테스트용임!!!
	@RequestMapping("/insertPostTest")
	public String insertPost(@RequestParam("userId") String userId,
					PostVO vo, HttpSession session, RedirectAttributes redirectAttributes) throws IllegalStateException, IOException {
	    System.out.println("insertPostTest");
	    //게시글 등록하기 ------------------------------------------------------
		vo.setSellerId(userId);
		vo.setPostCatId(1L);
		vo.setPostTitle("배추안팔아" + userId + "님이 올린 게시글이다");
		vo.setPostPrice(50000000);
		vo.setPostContent("김하은의 알림 구현하기 프로젝트트" + userId);
		
		postService.insertPost(vo);
		System.out.println("인설트 완료");
		
//	    redirectAttributes.addFlashAttribute("myData", vo);

//		return "redirect:/test";
		System.out.println(vo);
		List<Map<String, String>>  a = notiService.checkWishKeyWord(vo);
		System.out.println(vo.getPostTitle());
		System.out.println(vo.getPostContent());
		System.out.println(a.toArray());
		
		if (a != null) {
			for (Map<String, String> row : a) {
			    String wishUserId = row.get("USER_ID");
			    String wishKeyword = row.get("WISH_KEYWORD");

			    System.out.println("wishUserId: " + wishUserId + ", Wish Keyword: " + wishKeyword);
			    
			    // 데이터에 추가적인 필드를 넣어 URL에 해당하는 값을 전달
			    Map<String, Object> data = new HashMap<>();
			    data.put("id", vo.getPostId());
			    data.put("message", "[키워드 알림] <br>" + wishKeyword + 
			    	    " - "  + vo.getPostTitle());
			    
			    // JSON 형식으로 변환
			    ObjectMapper objectMapper = new ObjectMapper();
			    String jsonData;
				try {
					jsonData = objectMapper.writeValueAsString(data);

//					voN.setUserId(vo.getSellerId());
//					voN.setPostId(vo.getPostId());
//					voN.setNotiType("POST");
//					voN.setNotiContent(vo.getPostTitle());
//					voN.setNotiUrl("hello~it'sme~~~");
			    	
			    	//노티 테이블 insert
//			    	notiService.insertNoti(voN);
//			    	System.out.println(voN);
//				    notiService.send(wishUserId, "관심상품업로드", jsonData, voN);

				    notiService.send(wishUserId, "관심상품업로드", jsonData);

				} catch (JsonProcessingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			    
			}
		}
		
		String b = "hey why you cannot read hanguel manghalnoma!!!!";
		return b;
		
	}
	
	@RequestMapping("/test")
	public String test(@RequestParam("myData") PostVO vo, NotiVO voN, Model model) {
		
		
		return "main";
	}
	
	@RequestMapping("/updatePostTest")
	public String updatePost(PostVO vo) {
		System.out.println("updatePostTest");
		System.out.println("vo : " + vo);
		vo.setPostPrice(555555);
		vo.setPostId(1L);
		
		postService.updatePost(vo);
		String a = "아니 유티에프팔 하.... testestset ";
		return a;
	}
}
