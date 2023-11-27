package com.cabbage.biz.noti.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cabbage.biz.main.post.PostVO;
import com.cabbage.biz.noti.NotiVO;

@Repository
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

	//글수정
	public void updateNoti(NotiVO vo) {
		System.out.println("===> MyBatis JDBC로 updateBoard() 실행");
		mybatis.update("notiDAO.updateBoard", vo);
	}

	//글삭제
	public void deleteNoti(NotiVO vo) {
		System.out.println("===> MyBatis JDBC로 deleteBoard() 실행");
		mybatis.delete("notiDAO.deleteBoard", vo);
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
	
	//전체 게시글 조회
//	public List<NotiVO> getBoardList(NotiVO vo) {
//		System.out.println("===> MyBatis JDBC로 getBoardList() 실행");
//		// 검색조건 값이 없을 때 기본값 설정
//		if (vo.getSearchCondition() == null) {
//			vo.setSearchCondition("TITLE");
//		}
//		if (vo.getSearchKeyword() == null) {
//			vo.setSearchKeyword("");
//		}
//		String sql = "";
//		if ("TITLE".equals(vo.getSearchCondition())) {
//			sql = "boardDAO.getBoardList_T";
//		} else if ("CONTENT".equals(vo.getSearchCondition())) {
//			sql = "boardDAO.getBoardList_C";
//		}
//		
//		return mybatis.selectList(sql, vo.getSearchKeyword());
//	}
	
	public List<Map<String, String>> checkWishKeyWord(PostVO postVo) {
		System.out.println("여기는 노티다오 ㅇㅇ checkWishKeyWord");
		Map<String, String> map = new HashMap<>();
		map.put("postTitle", postVo.getPostTitle());
		map.put("postContent", postVo.getPostContent());
		return mybatis.selectList("notiDAO.checkWishKeyWord", map);
	}
	
	
		
}
