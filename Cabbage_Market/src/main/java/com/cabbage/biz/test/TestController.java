package com.cabbage.biz.test;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cabbage.biz.chat.chat.ChatRoomService;
import com.cabbage.biz.chat.chat.ChatRoomVO;
import com.cabbage.biz.chat.user.UserService;
import com.cabbage.biz.chat.user.UserVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping("/test")
@Controller
public class TestController {
	
	private final UserService userService;
	private final ChatRoomService chatRoomService;

	@GetMapping("")
	public String getTestPage() {
		return "/test/test";
	}
	
	@GetMapping("/user")
	public String userServiceTest(Model model) {
		UserVO user = userService.getUserById("jsw4795");
		
		model.addAttribute("userVO", user);
		
		return "/test/test";
	}
	
	@GetMapping("/chatRoom")
	public String chatRoomServiceTest(Model model) {
		ChatRoomVO chatRoom = chatRoomService.getChatRoomById(0);
		
		model.addAttribute("chatRoomVO", chatRoom);
		
		return "/test/test";
	}
	

	
}
