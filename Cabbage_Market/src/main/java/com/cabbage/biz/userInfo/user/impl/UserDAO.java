package com.cabbage.biz.userInfo.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cabbage.biz.userInfo.user.UserVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class UserDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public UserVO getUser(UserVO vo) {
		return mybatis.selectOne("userDAO.getUser", vo);
	}

	public void joinUser(UserVO vo) {
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
		return mybatis.selectOne("userDAO.findId", vo);
	}
	
	public UserVO findPw(UserVO vo) {
		return mybatis.selectOne("userDAO.findPw", vo);
	}

	public List<UserVO> purchaseList(UserVO vo) {
		return mybatis.selectList("userDAO.purchaseList", vo);
	}
	
	public List<UserVO> salesList(UserVO vo) {
		return mybatis.selectList("userDAO.salesList", vo);
	}
	
	public List<UserVO> wishList(UserVO vo) {
		return mybatis.selectList("userDAO.wishList", vo);
	}
	
	public UserVO userInfo(UserVO vo) {
		return mybatis.selectOne("userDAO.userInfo", vo);
	}
	
	
	public void profileUpload(UserVO vo) {
		mybatis.insert("userDAO.profileUpload", vo);
	}
	
	public void profileUpload2(UserVO vo) {
		mybatis.insert("userDAO.profileUpload2", vo);
	}
	
	public void profileUpload3(UserVO vo) {
		mybatis.update("userDAO.profileUpload3", vo);
	}
	
	public void userUpdate(UserVO vo) {
		mybatis.update("userDAO.userUpdate", vo);
	}
	
	public void wishKeyword(UserVO vo) {
		mybatis.insert("userDAO.wishKeyword", vo);
	}
	

}
