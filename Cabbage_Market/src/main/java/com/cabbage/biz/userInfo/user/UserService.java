package com.cabbage.biz.userInfo.user;

import java.util.List;

public interface UserService {
	
	UserVO getUser(UserVO vo);

	void joinUser(UserVO vo);

	boolean selectId(String userId);
	
	boolean selectNick(String userNickname);
	
	boolean selectPhone(String userPhone);

	UserVO findId(UserVO vo);
	
	UserVO findPw(UserVO vo);

	List<UserVO> purchaseList(UserVO vo);
	
	List<UserVO> salesList(UserVO vo);
	
	List<UserVO> wishList(UserVO vo);
	
	UserVO userInfo(UserVO vo);

	void profileUpload(UserVO vo);
	
	void profileUpload2(UserVO vo);
	
	void profileUpload3(UserVO vo);
	
	void userUpdate(UserVO vo);
	
	void wishKeyword(UserVO vo);
}
