package com.cabbage.biz.noti;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

public class NotiVO {
	private Long notiId;
	private String userId;
	private Long postId;
	private int qaId;
	private String notiType;
	private String notiContent;
	private String notiUrl;
	private Date notiDate;

	public NotiVO() {
		System.out.println("NotiVO() 객체가 생성됨");
	}

 
	
	public Long getNotiId() {
		return notiId;
	}

	public void setNotiId(Long notiId) {
		this.notiId = notiId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Long getPostId() {
		return postId;
	}

	public void setPostId(Long postId) {
		this.postId = postId;
	}

	public int getQaId() {
		return qaId;
	}

	public void setQaId(int qaId) {
		this.qaId = qaId;
	}

	public String getNotiType() {
		return notiType;
	}

	public void setNotiType(String notiType) {
		this.notiType = notiType;
	}

	public String getNotiContent() {
		return notiContent;
	}

	public void setNotiContent(String notiContent) {
		this.notiContent = notiContent;
	}

	public String getNotiUrl() {
		return notiUrl;
	}

	public void setNotiUrl(String notiUrl) {
		this.notiUrl = notiUrl;
	}

	public Date getNotiDate() {
		return notiDate;
	}

	public void setNotiDate(Date notiDate) {
		this.notiDate = notiDate;
	}

	@Override
	public String toString() {
		return "NotiVO [notiId=" + notiId + ", userId=" + userId + ", postId=" + postId + ", qaId=" + qaId
				+ ", notiType=" + notiType + ", notiContent=" + notiContent + ", notiUrl=" + notiUrl + ", notyDate="
				+ notiDate + "]";
	}
	
}
