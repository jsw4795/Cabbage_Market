package com.cabbage.biz.userInfo.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cabbage.biz.userInfo.user.UserVO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public UserDAO() {
		System.out.println(">> UserDAO() 객체 생성");
	}

	public UserVO getUser(UserVO vo) {
		System.out.println(">> Spring  mybatis로 getUser() 실행");
		return mybatis.selectOne("userDAO.getUser", vo);
	}

	public void joinUser(UserVO vo) {
		System.out.println("==> Mybatis로 joinUser() 기능 처리");
		mybatis.insert("userDAO.joinUser", vo);
	}

	public boolean selectId(String userId) {
		return mybatis.selectOne("userDAO.selectId", userId);
	}
	
	public boolean selectNick(String userNickname) {
		return mybatis.selectOne("userDAO.selectNick", userNickname);
	}
	
	public boolean selectPhone(String userPhone) {
		return mybatis.selectOne("userDAO.selectPhone", userPhone);
	}

	public UserVO findId(UserVO vo) {
		System.out.println(">> Spring  mybatis로 findId 실행");
		return mybatis.selectOne("userDAO.findId", vo);
	}
	
	public UserVO findPw(UserVO vo) {
		System.out.println(">> Spring  mybatis로 findPw 실행");
		return mybatis.selectOne("userDAO.findPw", vo);
	}

	public List<UserVO> purchaseList(UserVO vo) {
		System.out.println(">> Spring  mybatis로 purchaselist 실행");
		return mybatis.selectList("userDAO.purchaseList", vo);
	}
	
	public List<UserVO> salesList(UserVO vo) {
		System.out.println(">> Spring  mybatis로 saleslist 실행");
		return mybatis.selectList("userDAO.salesList", vo);
	}
	
	public List<UserVO> wishList(UserVO vo) {
		System.out.println(">> Spring  mybatis로 wishlist 실행");
		return mybatis.selectList("userDAO.wishList", vo);
	}
	
	public UserVO userInfo(UserVO vo) {
		System.out.println(">> Spring  mybatis로 userInfo 실행");
		return mybatis.selectOne("userDAO.userInfo", vo);
	}
	
	
	public void profileUpload(UserVO vo) {
		System.out.println("==> Mybatis로 프로필 업로드() 기능 처리");
		mybatis.insert("userDAO.profileUpload", vo);
	}
	
	public void profileUpload2(UserVO vo) {
		System.out.println("==> Mybatis로 프로필 업로드() 기능 처리");
		mybatis.insert("userDAO.profileUpload2", vo);
	}
	
	public void profileUpload3(UserVO vo) {
		System.out.println("==> Mybatis로 프로필 업로드() 기능 처리");
		mybatis.update("userDAO.profileUpload3", vo);
	}
	
	public void userUpdate(UserVO vo) {
		System.out.println("유저 정보 업데이트");
		mybatis.update("userDAO.userUpdate", vo);
	}
	
	public void wishKeyword(UserVO vo) {
		System.out.println("==> Mybatis로 wishKeyword() 기능 처리");
		mybatis.insert("userDAO.wishKeyword", vo);
	}
	

}
