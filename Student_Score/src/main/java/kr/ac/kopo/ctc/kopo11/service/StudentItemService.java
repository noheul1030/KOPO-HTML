package kr.ac.kopo.ctc.kopo11.service;

import kr.ac.kopo.ctc.kopo11.dao.StudentItemDao;
import kr.ac.kopo.ctc.kopo11.dto.Pagination;

public interface StudentItemService {
	StudentItemDao getStudentItemDao();
	void setStudentItemDao(StudentItemDao studentItemDao);
	
	Pagination getPagination(int page, int countPerPage);
	
}