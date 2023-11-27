package com.cabbage.biz.main.post.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cabbage.biz.main.post.PostVO;


@Repository()
public class MainDAO {
	
	private SqlSessionTemplate mybatis;
	
	public MainDAO() {
		System.out.println(">>> PostDAO() 객체 생성");
	}
	
	@Autowired
	public MainDAO(SqlSessionTemplate mybatis) {
		System.out.println(">>> PostDAO(SqlSessionTemplate) 객체 생성");
		this.mybatis = mybatis;
	}
	
	//글입력
    @Transactional
	public void insertPost(PostVO vo) {
		System.out.println("===> MyBatis JDBC로 insertPost() 실행");
		mybatis.insert("mainPostDAO.insertPost", vo);
		
	}

	//글수정
	public void updatePost(PostVO vo) {
		System.out.println("===> MyBatis JDBC로 updatePost() 실행");
		mybatis.update("mainPostDAO.updatePost", vo);
	}
	
	//최신포스트 출력하기 20개
	public List<PostVO> getPostListForNew() {
		System.out.println("===> MyBatis JDBC로 getPostListForNew() 실행");
		return mybatis.selectList("mainPostDAO.getPostListForNew");
	}
	
	//추천포스트 뷰카운트로 출력하기 20개
	public List<PostVO> getPostListForRcByVc() {
		System.out.println("===> MyBatis JDBC로 getPostListForRcByVc() 실행");
		return mybatis.selectList("mainPostDAO.getPostListForRcByVc");
	}
		
		
	//추천포스트 아이디로 출력하기 20개
	public List<PostVO> getPostListForRcById(String id) {
		System.out.println("===> MyBatis JDBC로 getPostListForRcById() 실행");
		return mybatis.selectList("mainPostDAO.getPostListForRcById", id);
	}
	
	//최신포스트 출력하기 전체
	public List<PostVO> getPostListForNewAll(int begin, int end) {
		System.out.println("===> MyBatis JDBC로 getPostListForNewAll() 실행");
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		return mybatis.selectList("mainPostDAO.getPostListForNewAll", map);
	}
	
	public int countNewAll() {
		System.out.println("===> MyBatis JDBC로 countNewAll() 실행");
		return mybatis.selectOne("mainPostDAO.countNewAll");
	}
	
	//추천포스트 뷰카운트로 출력하기 전체
	public List<PostVO> getPostListForRcByVcAll(int begin, int end) {
		System.out.println("===> MyBatis JDBC로 getPostListForRcByVcAll() 실행");
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		return mybatis.selectList("mainPostDAO.getPostListForRcByVcAll", map); 
	}
		
	public int countVcAll() {
		System.out.println("===> MyBatis JDBC로 countVcAll() 실행");
		return mybatis.selectOne("mainPostDAO.countVcAll");
	}
		
	//추천포스트 아이디로 출력하기 전체
	public List<PostVO> getPostListForRcByIdAll(String id, int begin, int end) {
		System.out.println("===> MyBatis JDBC로 getPostListForRcByIdAll() 실행");
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("begin", begin);
		map.put("end", end);
		System.out.println(map.size());
		System.out.println(id);
		System.out.println(begin);
		System.out.println(end);
		return mybatis.selectList("mainPostDAO.getPostListForRcByIdAll", map);
	}
	
	public int countIdAll(String id) {
		System.out.println("===> MyBatis JDBC로 countIdAll() 실행");
		System.out.println(id);
		return mybatis.selectOne("mainPostDAO.countIdAll", id);
	}
		
}
