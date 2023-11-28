package com.cabbage.biz.qa.qa.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cabbage.biz.qa.qa.QaService;
import com.cabbage.biz.qa.qa.QaVO;

//@Service : @Component 상속 확장 어노테이션
//비즈니스 로직 처리 서비스 영역에 사용
@Service("qaService")
public class QaServiceImpl implements QaService {
	@Autowired //타입이 일치하는 객체(인스턴스) 주입
	private QaDAO QaDAO;

	public QaServiceImpl() {
		System.out.println(">> QaServiceImpl() 객체 생성");
	}
	
	@Override
	public void insertQa(QaVO vo) {
		QaDAO.insertQa(vo);
	}

	@Override
	public void updateQa(QaVO vo) {
		QaDAO.updateQa(vo);
	}

	@Override
	public void deleteQa(QaVO vo) {
		QaDAO.deleteQa(vo);
	}

	@Override
	public QaVO getQa(QaVO vo) {
		return QaDAO.getQa(vo);
	}
	
	@Override
	public List<QaVO> getQaList(QaVO vo) {
		System.out.println(">>> QaServiceImpl - getQaList 메소드 호출");
		return QaDAO.getQaList(vo);
	}
	
	
	@Override
	public List<QaVO> getQaList(String userId) {
		System.out.println(">>> QaServiceImpl - getQaList 메소드 호출");
		return QaDAO.getQaList(userId);
	}
	
	@Override
    public List<QaVO> getQaCategoryList() {
        return QaDAO.getQaCategoryList();
    }

	
	// QaForm.jsp에서 QA_CAT_CONTENT 출력!
	@Override
    public String getQaCatContentByCategoryId(String categoryId) {
        return QaDAO.getQaCatContentByCategoryId(categoryId);
    }
	
	// 1:1 문의내역 내용 조회
	@Override
	public QaVO getQaFormDetail(QaVO vo) {
		System.out.println(">>> QaServiceImpl - getQaFormDetail 메소드 호출");
		return QaDAO.getQaFormDetail(vo);
	}
	
	
	@Override
	public List<QaVO> getQaKeywordList(String searchCondition, String searchKeyword) {
		 return QaDAO.getQaKeywordList(searchCondition, searchKeyword);
	}
	
	
	// 1:1 문의내역 삭제 DELETE
	@Override
	public void deleteQaFormDetail(QaVO vo) {
		QaDAO.deleteQaFormDetail(vo);
	}

	
	
	// Admim 관리자모드 ----------------------------------------------------
	// Admin 관리자모드에서 사용자 문의 리스트
	@Override
	public List<QaVO> getAdminQaList() {
		System.out.println(">>> QaServiceImpl - getAdminQaList 메소드 호출");
		return QaDAO.getAdminQaList();
	}
	
	// Admin 관리자모드에서 문의내역 댓글 삭제
	@Override
	public void deleteAdminComment(QaVO vo) {
		QaDAO.deleteAdminComment(vo);
		
	}

	@Override
	public QaVO getAdminQaFormDetail(QaVO vo) {
		return QaDAO.getAdminQaFormDetail(vo);
	}

	@Override
	public void insertAdminComment(QaVO vo) {
		QaDAO.insertAdminComment(vo);
	}

	

	

	
}
