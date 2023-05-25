package kr.ac.kopo.ctc.kopo11.service;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import kr.ac.kopo.ctc.kopo11.dao.StudentItemDao;
import kr.ac.kopo.ctc.kopo11.dto.Pagination;

class StudentItemService_JTest {

	@Test
	void test() {
		//fail("Not yet implemented");
		StudentItemDao studentItemDao = new StudentItemDaoMock();
		StudentItemService studentItemService = new StudentItemServiceImpl();
		
		studentItemService.setStudentItemDao(studentItemDao);
		
		Pagination p = studentItemService.getPagination(0, 0);
		
		assertEquals(p.getC(),5);
	}

}
