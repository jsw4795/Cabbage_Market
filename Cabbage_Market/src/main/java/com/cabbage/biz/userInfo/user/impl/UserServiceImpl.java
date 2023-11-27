package com.cabbage.biz.userInfo.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cabbage.biz.userInfo.user.UserService;
import com.cabbage.biz.userInfo.user.UserVO;


@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;

	public UserServiceImpl() {
		System.out.println(">> UserServiceImpl() 객체 생성");
	}

	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}
	
	@Override
	public void joinUser(UserVO vo) {
		userDAO.joinUser(vo);
	}

	@Override
	public boolean selectId(String userId) {
		return userDAO.selectId(userId);
	}
	
	@Override
	public boolean selectNick(String userNickname) {
		return userDAO.selectNick(userNickname);
	}
	
	@Override
	public boolean selectPhone(String userPhone) {
		return userDAO.selectPhone(userPhone);
	}
	
	@Override
	public UserVO findId(UserVO vo) {
		return userDAO.findId(vo);
	}
	
	@Override
	public UserVO findPw(UserVO vo) {
		return userDAO.findPw(vo);
	}
	
	@Override
	public List<UserVO> purchaseList(UserVO vo) {
		return userDAO.purchaseList(vo);
	}
	
	@Override
	public List<UserVO> salesList(UserVO vo) {
		return userDAO.salesList(vo);
	}
	
	@Override
	public List<UserVO> wishList(UserVO vo) {
		return userDAO.wishList(vo);
	}
	
	@Override
	public UserVO userInfo(UserVO vo) {
		return userDAO.userInfo(vo);
	}
	
	
	@Override
	public void profileUpload(UserVO vo) {
		userDAO.profileUpload(vo);
	}
	
	@Override
	public void profileUpload2(UserVO vo) {
		userDAO.profileUpload2(vo);
	}
	
	@Override
	public void profileUpload3(UserVO vo) {
		userDAO.profileUpload3(vo);
	}
	
	@Override
	public void userUpdate(UserVO vo) {
		userDAO.userUpdate(vo);
	}
	
	@Override
	public void wishKeyword(UserVO vo) {
		userDAO.wishKeyword(vo);
	}
	
	
	
}
