package com.cabbage.biz.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.cabbage.biz.main.post.PostService;
import com.cabbage.biz.main.post.PostVO;
import com.cabbage.biz.search.search.SearchService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Component
public class ListContainer {
	
	@Qualifier("mainPostService")
	private final PostService postService;
	private final SearchService searchService;
	
	private Timer timer;
	private TimerTask timerTask;
	
	public List<PostVO> top100Post;
	public List<String> top10Search;
	
	
	@PostConstruct
	public void init() {
		int delay = 0;
		int period = 15 * 60 * 1000; // 15분
		timer = new Timer();
		
		// 시간마다 수행할 일 설정
		timerTask = new TimerTask() {
			
			@Override
			public void run() {
				
				List<PostVO> newTop100Post = postService.getTop100Post();
				List<String> newTop10Search = searchService.TopSearched();
				top100Post = new ArrayList<PostVO>(newTop100Post);
				top10Search = new ArrayList<String>(newTop10Search);
				
				
				System.out.println("---순위 업데이트 완료---");
			}
		};
		timer.scheduleAtFixedRate(timerTask, delay, period);
	}
}
