package kr.ac.kopo.ctc.kopo11.service;

import kr.ac.kopo.ctc.kopo11.dao.StudentItemDao;
import kr.ac.kopo.ctc.kopo11.dto.Pagination;

public class StudentItemServiceTest {
		// junit
	
	public static void main(String[] args) {
		
		StudentItemDao studentItemDao = new StudentItemDaoMock();
		StudentItemService studentItemService = new StudentItemServiceImpl();
		
		studentItemService.setStudentItemDao(studentItemDao);
		
		Pagination p = studentItemService.getPagination(0, 0);
		
	}
}
