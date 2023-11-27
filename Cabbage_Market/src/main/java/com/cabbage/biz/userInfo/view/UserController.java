package com.cabbage.biz.userInfo.view;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cabbage.biz.userInfo.user.UserService;
import com.cabbage.biz.userInfo.user.UserVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping("/user")
@Controller
public class UserController {
	
	private final UserService userService;

	@GetMapping("/login")
	public String getLoginPage() {
		return "user/login";
	}

	@GetMapping("/findAccount")
	public String getfindPage() {
		return "user/findAccount";
	}

	@GetMapping("/signUp")
	public String getsignUpPage() {
		return "user/signUp";
	}
	
	@GetMapping("/deleteUser")
	public String deletePage() {
		return "user/deleteUser";
	}
	
	@GetMapping("/deleteModal")
	public String deleteModal() {
		return "user/deleteModal";
	}

	@GetMapping("/myInfo")
    public String getinfoPage(UserVO vo, Model model, HttpSession session) {
		vo.setUserId((String)session.getAttribute("userId"));
        // userId로 사용자 정보를 가져오는 예시
		UserVO user = userService.userInfo(vo);
		System.out.println("filename: " + user.getUserProfile());
		if (user.getUserProfile() == null) {
			user.setUserProfile("profile_default.png");
		}
        // 모델에 사용자 정보를 추가하여 뷰로 전달
        model.addAttribute("user", user);
        model.addAttribute("nowUserId", vo.getUserId());

        return "user/myInfo";
    }
	
	@GetMapping("/info/{id}")
    public String getinfoPage(UserVO vo, Model model, HttpSession session, @PathVariable String id) {
		String userId = (String)session.getAttribute("userId");
		vo.setUserId(id);
        // userId로 사용자 정보를 가져오는 예시
		UserVO user = userService.userInfo(vo);
		System.out.println("filename: " + user.getUserProfile());
		if (user.getUserProfile() == null) {
			user.setUserProfile("profile_default.png");
		}
        // 모델에 사용자 정보를 추가하여 뷰로 전달
        model.addAttribute("user", user);
        model.addAttribute("nowUserId", userId);

        return "user/myInfo";
    }
	
	@GetMapping("/infoUpdate")
	public String getinfoUpdatePage(UserVO vo, Model model, HttpSession session) {
		vo.setUserId((String)session.getAttribute("userId"));
		UserVO user = userService.userInfo(vo);
		
		model.addAttribute("user", user);
		return "user/infoUpdate";
	}
	
	@RequestMapping("/userUpdate")
	public String userUpdate(UserVO vo) {
		userService.userUpdate(vo);
		return "redirect:/user/myInfo";
	}
	
	@PostMapping("/userUpdate")
	public String updateUser(UserVO vo, HttpSession session) {
	    // 기존 정보를 가져오기 위해 userId로 DB에서 정보 조회
		vo.setUserId((String)session.getAttribute("userId"));
		UserVO user = userService.userInfo(vo);

	    // 기존 정보를 유지하기 위해 빈 값인 경우 기존 정보로 대체
	    if (vo.getUserNickname() == null || vo.getUserNickname().isEmpty()) {
	        vo.setUserNickname(user.getUserNickname());
	    }

	    if (vo.getUserPassword() == null || vo.getUserPassword().isEmpty()) {
	        vo.setUserPassword(user.getUserPassword());
	    }

	    if (vo.getUserPhone() == null || vo.getUserPhone().isEmpty()) {
	        vo.setUserPhone(user.getUserPhone());
	    }

	    // DB에 수정된 정보 업데이트
	    userService.userUpdate(vo);

	    return "redirect:/user/myInfo"; // 수정 완료 후 프로필 페이지로 리다이렉트
	}
	
	
	
	@PostMapping("/loginIn")
	public String login(UserVO vo, HttpSession session, RedirectAttributes redirectAttributes) {
		if (vo.getUserId() == null || vo.getUserId().isEmpty()) {
			redirectAttributes.addFlashAttribute("message", "아이디를 입력해주세요.");
			
			return "redirect:/user/login";
		}

		if (vo.getUserPassword() == null || vo.getUserPassword().isEmpty()) {
			redirectAttributes.addFlashAttribute("message", "비밀번호를 입력해주세요.");
			return "redirect:/user/login";
		}

		UserVO user = userService.getUser(vo);

		if (user != null) {
			System.out.println(">> 로그인 성공!!!");
			session.setAttribute("userId", user.getUserId());
			System.out.println("레그데이트 : " + user.getUserRegdate());
			return "redirect:/user/myInfo";
		} else {
			redirectAttributes.addFlashAttribute("message", "아이디 또는 비밀번호를 확인해주세요.");
			return "redirect:/user/login";
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println(">>> 로그아웃 처리");
		session.invalidate();

		return "login";
	}

	@RequestMapping("/joinUser")
	public String joinAction(UserVO vo) {
		System.out.println(vo);
		userService.joinUser(vo);
		return "redirect:/user/login";
	}

	// Id 중복 확인
	@PostMapping("/ConfirmId")
	@ResponseBody
	public ResponseEntity<Boolean> confirmId(String userId) {
		System.out.println(userId);
		boolean result = true;
		if (userId.trim().isEmpty()) {
			result = false;
		} else {
			if (userService.selectId(userId)) {
				result = false;
			} else {
				result = true;
			}
		}

		return new ResponseEntity<>(result, HttpStatus.OK);
	}

	// 닉네임 중복 확인
	@PostMapping("/ConfirmNick")
	@ResponseBody
	public ResponseEntity<Boolean> confirmNick(String userNickname) {
		System.out.println(userNickname);
		boolean result = true;
		if (userNickname.trim().isEmpty()) {
			result = false;
		} else {
			if (userService.selectNick(userNickname)) {
				result = false;
			} else {
				result = true;
			}	
		}

		return new ResponseEntity<>(result, HttpStatus.OK);
	}

	// 핸드폰 중복 확인
	@PostMapping("/ConfirmPhone")
	@ResponseBody
	public ResponseEntity<Boolean> confirmPhone(String userPhone) {
		boolean result = true;
		if (userPhone.trim().isEmpty()) {
			result = false;
		} else {
			if (userService.selectPhone(userPhone)) {
				result = false;
			} else {
				result = true;
			}
		}

		return new ResponseEntity<>(result, HttpStatus.OK);
	}

	// 아이디 찾기
	@PostMapping("/findId")
	public String findId(UserVO vo, RedirectAttributes redirectAttributes) {
		if (vo.getUserName() == null || vo.getUserName().isEmpty()) {
			redirectAttributes.addFlashAttribute("message", "이름을 입력해주세요.");
			return "redirect:/user/findAccount";

		}

		if (vo.getUserPhone() == null || vo.getUserPhone().isEmpty()) {
			redirectAttributes.addFlashAttribute("message", "전화번호를 입력해주세요.");
			return "redirect:/user/findAccount";
		}

		UserVO user = userService.findId(vo);

		if (user != null) {
			System.out.println(">> 아이디 존재");
			redirectAttributes.addFlashAttribute("message", "회원님의 아이디는  [" + user.getUserId() + "] 입니다");
			return "redirect:/user/login";
		} else {
			redirectAttributes.addFlashAttribute("message", "계정이 존재하지않아요");
			return ("redirect:/user/login");
		}
	}

	// 비밀번호 찾기
	@PostMapping("/findPw")
	public String findPw(UserVO vo, RedirectAttributes redirectAttributes) {
		if (vo.getUserEmail() == null || vo.getUserEmail().isEmpty()) {
			redirectAttributes.addFlashAttribute("message", "이메일을 입력해주세요.");
			return "redirect:/user/findAccount";
		}

		if (vo.getUserId() == null || vo.getUserId().isEmpty()) {
			redirectAttributes.addFlashAttribute("message", "아아디를 입력해주세요.");
			return "redirect:/user/findAccount";
		}

		UserVO user = userService.findPw(vo);

		if (user != null) {
			System.out.println(">> 비밀번호 보여주기");
			redirectAttributes.addFlashAttribute("message", "회원님의 비밀번호는  [" + user.getUserPassword() + "] 입니다");
			return "redirect:/user/login";
		} else {
			redirectAttributes.addFlashAttribute("message", "계정이 존재하지않아요");
			return "redirect:/user/login";
		}
	}

	@RequestMapping("/purchaseList")
	@ResponseBody
	public List<UserVO> purchaseList(UserVO vo, HttpSession session) {
		System.out.println("purchaseList 실행");
		vo.setUserId((String)session.getAttribute("userId"));
		List<UserVO> purchaseList = userService.purchaseList(vo);
		System.out.println("purchaseList : " + purchaseList);
		return purchaseList;
	}
	
	@RequestMapping("/salesList")
	@ResponseBody
	public List<UserVO> salesList(UserVO vo, HttpSession session) {
		System.out.println("saleList 실행");
		vo.setUserId((String)session.getAttribute("userId"));
		List<UserVO> salesList = userService.salesList(vo);
		System.out.println("salesList : " + salesList);
		return salesList;
	}
	
	@RequestMapping("/wishList")
	@ResponseBody
	public List<UserVO> wishList(UserVO vo, HttpSession session) {
		System.out.println("wishList 실행");
		vo.setUserId((String)session.getAttribute("userId"));
		List<UserVO> wishList = userService.wishList(vo);
		System.out.println("wishList : " + wishList);
		return wishList;
	}
	
	@PostMapping("/profileUpload")
	public String profileUpload(MultipartFile uploadFile, HttpSession session, UserVO vo) throws IllegalStateException, IOException {
		
		uploadFile = vo.getUploadFile();
		System.out.println("> uploadFile : " + uploadFile);
		
		if (uploadFile == null) {
			System.out.println("::: uploadFile 파라미터가 전달되지 않은 경우");
		} else if (uploadFile.isEmpty()) {
			System.out.println("::: 전달받은 파일 데이터가 없는 경우");
		} else { //업로드 파일이 존재하는 경우
			
			//원본파일명 구하기
			String filename = uploadFile.getOriginalFilename();
			System.out.println("::: 원본파일명 : " + filename);
			String extension = filename.substring(filename.lastIndexOf("."), filename.length());
			String savedFilename = "PROFILE_PIC" + UUID.randomUUID().toString() + extension;
			System.out.println("::: 저장파일명 : " + savedFilename);
			
			//물리적 파일 복사
			String destPathFile = "C:/MyStudy/70_Spring/Cabbage_Market/src/main/webapp/resources/pic/profilePic/" + savedFilename;
			uploadFile.transferTo(new File(destPathFile));
			vo.setFileName(savedFilename);
			vo.setUserId((String)session.getAttribute("userId"));
		}
			userService.profileUpload(vo);
			userService.profileUpload2(vo);
			userService.profileUpload3(vo);
			
			return "redirect:/user/myInfo";
			
	}
	



}
