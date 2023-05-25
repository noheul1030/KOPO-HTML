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
		
		pagination.setC(5);
		
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
