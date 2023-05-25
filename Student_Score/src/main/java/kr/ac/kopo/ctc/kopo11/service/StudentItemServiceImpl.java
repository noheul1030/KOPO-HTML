package kr.ac.kopo.ctc.kopo11.service;

import kr.ac.kopo.ctc.kopo11.dao.StudentItemDao;
import kr.ac.kopo.ctc.kopo11.dto.Pagination;

public class StudentItemServiceImpl implements StudentItemService {

	private StudentItemDao studentItemDao;

//	public StudentItemDao getStudentItemDao() {
//		return studentItemDao;
//	}
//
//	public void setStudentItemDao(StudentItemDao studentItemDao) {
//		this.studentItemDao = studentItemDao;
//	}

	@Override
	public Pagination getPagination(int page, int countPerPage) {
		studentItemDao.selectAll(0, 0);

		Pagination pagination = new Pagination();

		// 총 데이터 수 
		int totalcount = studentItemDao.totalcount();
		// 현재 카운트 조정
		int countCheck = (countPerPage > totalcount || countPerPage <=0) ? totalcount: countPerPage;
		// 최대 페이지 수 
		int maxpage = (totalcount % countCheck == 0) ? (totalcount / countCheck) : (totalcount / countCheck) + 1;
		// 현재 페이지 조정
		int pageCheck;
		if (page<=0){ // 현재페이지가 0보다 작으면
			pageCheck = 1;
		}else if(page>maxpage){ // 현재 페이지가 최대페이지 보다 크면
			pageCheck = maxpage;
		}else { // 1 ~ 최대페이지 
			pageCheck = page;
		}
		
		// 현재 페이지의 처음
		int startPage = (((int)((pageCheck-1)/10))*10)+1;
		// 현재 페이지의 마지막
		int endPage = (startPage+9>maxpage) ? maxpage:startPage+9;
		// 첫페이지
		int firstPage = 1;
		int N = (endPage+9>maxpage)?maxpage:startPage+2 ;

		pagination.setC(pageCheck);
		pagination.setS(startPage);
		
		if (pageCheck < maxpage) {

			if (pageCheck <= 10) {
				pagination.setPp(startPage-2);
				pagination.setP(startPage-2);
				pagination.setE(endPage);
				pagination.setN(N);
				pagination.setNn(startPage+10);
			} else if (pageCheck > 10 && pageCheck < maxpage) {
				pagination.setPp(firstPage);
				pagination.setP(startPage-10);
				pagination.setE(endPage);
				pagination.setN(N);
				pagination.setNn(-1);
			}
		} else if (page >= maxpage) {
			pagination.setPp(firstPage);
			pagination.setP(startPage-10);
			pagination.setE(maxpage);
			pagination.setN(N);
			pagination.setNn(endPage);
		}
		if( firstPage == 1 && endPage == 1) {
			pagination.setPp(startPage-2);
			pagination.setP(startPage-2);
			pagination.setN(startPage-2);
			pagination.setNn(startPage-2);
		}

		return pagination;
	}

	@Override
	public StudentItemDao getStudentItemDao() {
		return studentItemDao;
	}

	@Override
	public void setStudentItemDao(StudentItemDao studentItemDao) {
		this.studentItemDao = studentItemDao;

	}
}
