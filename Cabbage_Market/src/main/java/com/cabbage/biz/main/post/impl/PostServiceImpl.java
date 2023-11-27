package com.cabbage.biz.main.post.impl;

import org.springframework.stereotype.Service;

import com.cabbage.biz.main.post.PostService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class PostServiceImpl implements PostService {

	private final PostDAO postDAO;
	
}
