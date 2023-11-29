package com.cabbage.biz.noti.noti.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cabbage.biz.main.post.PostVO;
import com.cabbage.biz.noti.noti.NotiVO;

@Repository("notiDAO")
public class NotiDAO {

	private SqlSessionTemplate mybatis;
	
	public NotiDAO() {
		System.out.println(">>> NotiDAO() 객체 생성");
	}
	@Autowired
	public NotiDAO(SqlSessionTemplate mybatis) {
		System.out.println(">>> NotiDAO(SqlSessionTemplate) 객체 생성");
		this.mybatis = mybatis;
	}
	
	//글입력
	public void insertNoti(NotiVO vo) {
		System.out.println("===> MyBatis JDBC로 insertNoti() 실행");
		System.out.println(vo.getPostId());
		mybatis.insert("notiDAO.insertNoti", vo);
	}

	//알림 테이블 unread -> read
	public void updateNoti(String id) {
		System.out.println("===> MyBatis JDBC로 updateNoti() 실행");
		mybatis.update("notiDAO.updateNoti", id);
	}

	//글삭제
	public void deleteNoti(NotiVO vo) {
		System.out.println("===> MyBatis JDBC로 deleteNoti() 실행");
		mybatis.delete("notiDAO.deleteNoti", vo.getNotiId());
	}

	//게시글 1개 조회
	public NotiVO getNoti(NotiVO vo) {
		System.out.println("===> MyBatis JDBC로 getBoard() 실행");
		return mybatis.selectOne("notiDAO.getBoard", vo);
	}

	//전체 게시글 조회
	public List<NotiVO> getNotiList() {
		System.out.println("===> MyBatis JDBC로 getBoardList() 실행");
		return null;
	}
	
	public List<Map<String, String>> checkWishKeyWord(PostVO postVo) {
		System.out.println("여기는 노티다오 ㅇㅇ checkWishKeyWord");
		Map<String, String> map = new HashMap<>();
		map.put("postTitle", postVo.getPostTitle());
		map.put("postContent", postVo.getPostContent());
		return mybatis.selectList("notiDAO.checkWishKeyWord", map);
	}
	
	public List<String> checkPostWishList(PostVO postVo) {
		System.out.println("여기는 노티다오 ㅇㅇ checkPostWishList");
		System.out.println(postVo.getPostId());
		return mybatis.selectList("notiDAO.checkPostWishList", postVo.getPostId().intValue());
	}
	
	public int getNotiCountById(String id) {
		return mybatis.selectOne("notiDAO.getNotiCountById", id);
	}
	
	public List<NotiVO> getNotiListById(String id) {
		return mybatis.selectList("notiDAO.getNotiListById", id);
	}
		
}
