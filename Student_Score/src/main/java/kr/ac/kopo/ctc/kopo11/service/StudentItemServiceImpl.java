package kr.ac.kopo.ctc.kopo11.service;

import java.sql.SQLException;

import kr.ac.kopo.ctc.kopo11.dao.StudentItemDao;
import kr.ac.kopo.ctc.kopo11.dto.Pagination;

public class StudentItemServiceImpl implements StudentItemService {

	 private StudentItemDao studentItemDao;

//		public StudentItemDao getStudentItemDao() {
//			return studentItemDao;
//		}
	//
//		public void setStudentItemDao(StudentItemDao studentItemDao) {
//			this.studentItemDao = studentItemDao;
//		}

	    @Override
	    public Pagination getPagination(int page, int countPerPage) {
//			studentItemDao.selectAll(0, 0);
			

	        Pagination pagination = new Pagination();

	        // 1. 총 데이터 수
	        int totalcount = studentItemDao.count();

	        // 2. 현재 카운트 조정
	        int countCheck = (countPerPage > totalcount || countPerPage < 1) ? totalcount : countPerPage;

	        // 3. 최소 페이지 수
	        int minPage = 1;

	        // 4. 최대 페이지 수
	        int maxPage = (totalcount % countCheck == 0) ? (totalcount / countCheck) : (totalcount / countCheck) + 1;

	        // 5. C 현재 페이지 조정
	        int pageCheck;
	        /* 현재페이지가 0보다 작으면 */
	        if (page <= minPage)
	            pageCheck = minPage;
	        /* 현재 페이지가 최대페이지 보다 크면 */
	        else if (page > maxPage)
	            pageCheck = maxPage;
	        /* 1 ~ 최대페이지 */
	        else
	            pageCheck = page;

	        // 6. S 현재 페이지의 처음
	        int startPage = (((int) ((pageCheck - 1) / 10)) * 10) + 1;

	        // 7. E 현재 페이지의 마지막
	        int endPage = (startPage + 9 >= maxPage) ? maxPage : startPage + 9;

	        // 8. <, <<
	        int P = (startPage <= minPage) ? -1 : startPage - 10;
	        int PP = (P == -1) ? -1 : minPage;

	        // 9. >, >>
	        int N = (endPage + 1 <= maxPage) ? endPage + 1 : -1;
	        int NN = (N == -1) ? -1 : ((int) (maxPage / 10)) * 10 + 1;

	        pagination.setC(pageCheck);
	        pagination.setS(startPage);
	        pagination.setE(endPage);
	        pagination.setN(N);
	        pagination.setNn(NN);
	        pagination.setP(P);
	        pagination.setPp(PP);

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