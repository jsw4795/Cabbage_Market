package com.cabbage.biz.main.view;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cabbage.biz.main.post.PostService;
import com.cabbage.biz.main.post.PostVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MainController {
	@Qualifier("mainPostService")
    private final PostService postService;
	
	// 프로젝트 시작 시 실행
	@RequestMapping(value = "/")
	public String home(Model model, HttpSession session) {
		
		if (null == session.getAttribute("userId")) {
			List<PostVO> postS = postService.getPostListForNew();
			List<PostVO> postRV = postService.getPostListForRcByVc();
			model.addAttribute("somethingNew", postS);
			model.addAttribute("recomendPostByVeiwCount", postRV);
		} else {
			String id = (session.getAttribute("userId")).toString();

			List<PostVO> postRI = postService.getPostListForRcById(id);
			List<PostVO> postS = postService.getPostListForNew();
			List<PostVO> postRV = postService.getPostListForRcByVc();

			model.addAttribute("recomendPostById", postRI);
			model.addAttribute("somethingNew", postS);
			model.addAttribute("recomendPostByVeiwCount", postRV);
		}
				
		return "/main/main";
	}
	
	// 모두보기 클릭 시 실행
	@GetMapping("/All")
	public String getAll(@RequestParam(name = "type", required = false) String type, 
								HttpSession session, Model model) {
		
		 // 세션에서 id 값을 얻기
		String id = (String) session.getAttribute("userId");
		int totalC = 0;
        int totalP = 0;
		int curPage = 1;
		int end = curPage * 12;
		int begin = end - 12 + 1;
		List<PostVO> post = null;
		
		if ("RI".equals(type)) {
			totalC = postService.countIdAll(id);
	        totalP = (int) Math.ceil((double) totalC / 12);
			post = postService.getPostListForRcByIdAll(id, begin, end);
		} else if ("N".equals(type)) {
			totalC = postService.countNewAll();
	        totalP = (int) Math.ceil((double) totalC / 12);
			post = postService.getPostListForNewAll(begin, end);
		} else if ("RV".equals(type)) {
			totalC = postService.countVcAll();
	        totalP = (int) Math.ceil((double) totalC / 12);
			post = postService.getPostListForRcByVcAll(begin, end);
		}
		
		model.addAttribute("list", post);		
        model.addAttribute("totalP", totalP);
        model.addAttribute("curPage", curPage);
        model.addAttribute("type", type);
	    return "/main/all";

	}
	
	// 무한스크롤 용 메소드 for New
	@PostMapping("/All")
	public String getAllAjax(@RequestParam(name = "curPage", required = false) Integer curPage,
								HttpSession session, Model model, String type) {
		String id = (String) session.getAttribute("userId");
		
		int totalC = 0;
        int totalP = 0;
        List<PostVO> post = null;
        int end = curPage * 12;
		int begin = end - 12 + 1;
		
		switch(type) {
		case "N":
			totalC = postService.countNewAll();
	        post = postService.getPostListForNewAll(begin, end);
			break;
		case "RV":
			totalC = postService.countVcAll();
			post = postService.getPostListForRcByVcAll(begin, end);
			break;
		case "RI":
			totalC = postService.countIdAll(id);
			post = postService.getPostListForRcByIdAll(id, begin, end);
			break;
		}
		
		totalP = (int) Math.ceil((double) totalC / 12);

		model.addAttribute("list", post);
		model.addAttribute("totalP", totalP);
        model.addAttribute("curPage", curPage);

		return "/main/all_Ajax";
	}

	

}
