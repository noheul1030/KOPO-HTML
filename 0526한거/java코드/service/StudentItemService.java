package kr.ac.kopo05.service;

import java.sql.SQLException;

import kr.ac.kopo05.dao.StudentItemDao;
import kr.ac.kopo05.dto.Pagination;

public interface StudentItemService {
	
	StudentItemDao getStudentItemDao();
	void setStudentItemDao(StudentItemDao studentItemDao);
	
	public Pagination getPagination(int page, int countPerPage) throws ClassNotFoundException, SQLException;
}
