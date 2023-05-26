package kr.ac.kopo.ctc.kopo11.service;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import kr.ac.kopo.ctc.kopo11.dao.StudentItemDao;
import kr.ac.kopo.ctc.kopo11.dto.Pagination;

class StudentItemService_JTest {

	 @Test //
	    void test_5_1() {
	        // fail("Not yet implemented");
	        StudentItemDao studentItemDao = new StudentItemDaoMock();
	        StudentItemService studentItemService = new StudentItemServiceImpl();

	        studentItemService.setStudentItemDao(studentItemDao);

	        Pagination p = studentItemService.getPagination(1, 5);

	        assertEquals(p.getC(), 1);
	        assertEquals(p.getPp(), -1);
	        assertEquals(p.getP(), -1);
	        assertEquals(p.getS(), 1);
	        assertEquals(p.getE(), 10);
	        assertEquals(p.getN(), 11);
	        assertEquals(p.getNn(), 11);
	    }

	    @Test
	    void test_5_0() {
	        // fail("Not yet implemented");
	        StudentItemDao studentItemDao = new StudentItemDaoMock();
	        StudentItemService studentItemService = new StudentItemServiceImpl();

	        studentItemService.setStudentItemDao(studentItemDao);

	        Pagination p = studentItemService.getPagination(0, 5);

	        assertEquals(p.getC(), 1);
	        assertEquals(p.getPp(), -1);
	        assertEquals(p.getP(), -1);
	        assertEquals(p.getS(), 1);
	        assertEquals(p.getE(), 10);
	        assertEquals(p.getN(), 11);
	        assertEquals(p.getNn(), 11);

	    }

	    @Test //
	    void test_1_5() {
	        StudentItemDaoMock studentItemDao = new StudentItemDaoMock();
	        StudentItemService studentItemService = new StudentItemServiceImpl();

	        studentItemService.setStudentItemDao(studentItemDao);

	        Pagination pagination = studentItemService.getPagination(1, 5);
	        assertEquals(pagination.getC(), 1);
	        assertEquals(pagination.getPp(), -1);
	        assertEquals(pagination.getP(), -1);
	        assertEquals(pagination.getS(), 1);
	        assertEquals(pagination.getE(), 10);
	        assertEquals(pagination.getN(), 11);
	        assertEquals(pagination.getNn(), 11);
	    }

	    @Test //
	    void test_0_5() {
	        StudentItemDaoMock studentItemDao = new StudentItemDaoMock();

	        StudentItemService studentItemService = new StudentItemServiceImpl();
	        studentItemService.setStudentItemDao(studentItemDao);

	        Pagination pagination = studentItemService.getPagination(0, 5);
	        assertEquals(pagination.getC(), 1);
	        assertEquals(pagination.getPp(), -1);
	        assertEquals(pagination.getP(), -1);
	        assertEquals(pagination.getS(), 1);
	        assertEquals(pagination.getE(), 10);
	        assertEquals(pagination.getN(), 11);
	        assertEquals(pagination.getNn(), 11);
	    }

	    @Test //
	    void test_m1_5() {
	        StudentItemDaoMock studentItemDao = new StudentItemDaoMock();

	        StudentItemService studentItemService = new StudentItemServiceImpl();
	        studentItemService.setStudentItemDao(studentItemDao);

	        Pagination pagination = studentItemService.getPagination(-1, 5);
	        assertEquals(pagination.getC(), 1);
	        assertEquals(pagination.getPp(), -1);
	        assertEquals(pagination.getP(), -1);
	        assertEquals(pagination.getS(), 1);
	        assertEquals(pagination.getE(), 10);
	        assertEquals(pagination.getN(), 11);
	        assertEquals(pagination.getNn(), 11);
	    }

	    @Test //
	    void test_10_5() {
	        StudentItemDaoMock studentItemDao = new StudentItemDaoMock();

	        StudentItemService studentItemService = new StudentItemServiceImpl();
	        studentItemService.setStudentItemDao(studentItemDao);

	        Pagination pagination = studentItemService.getPagination(10, 5);
	        assertEquals(pagination.getC(), 10);
	        assertEquals(pagination.getPp(), -1);
	        assertEquals(pagination.getP(), -1);
	        assertEquals(pagination.getS(), 1);
	        assertEquals(pagination.getE(), 10);
	        assertEquals(pagination.getN(), 11);
	        assertEquals(pagination.getNn(), 11);
	    }

	    @Test //
	    void test_11_5() {
	        StudentItemDaoMock studentItemDao = new StudentItemDaoMock();

	        StudentItemService studentItemService = new StudentItemServiceImpl();
	        studentItemService.setStudentItemDao(studentItemDao);

	        Pagination pagination = studentItemService.getPagination(11, 5);
	        assertEquals(pagination.getC(), 11);
	        assertEquals(pagination.getPp(), 1);
	        assertEquals(pagination.getP(), 1);
	        assertEquals(pagination.getS(), 11);
	        assertEquals(pagination.getE(), 15);
	        assertEquals(pagination.getN(), -1);
	        assertEquals(pagination.getNn(), -1);
	    }

	    @Test
	    void test_14_5() {
	        StudentItemDaoMock studentItemDao = new StudentItemDaoMock();

	        StudentItemService studentItemService = new StudentItemServiceImpl();
	        studentItemService.setStudentItemDao(studentItemDao);

	        Pagination pagination = studentItemService.getPagination(14, 5);
	        assertEquals(pagination.getC(), 14);
	        assertEquals(pagination.getPp(), 1);
	        assertEquals(pagination.getP(), 1);
	        assertEquals(pagination.getS(), 11);
	        assertEquals(pagination.getE(), 15);
	        assertEquals(pagination.getN(), -1);
	        assertEquals(pagination.getNn(), -1);
	    }

	    @Test //
	    void test_15_5() {
	        StudentItemDaoMock studentItemDao = new StudentItemDaoMock();

	        StudentItemService studentItemService = new StudentItemServiceImpl();
	        studentItemService.setStudentItemDao(studentItemDao);

	        Pagination pagination = studentItemService.getPagination(15, 5);
	        assertEquals(pagination.getC(), 15);
	        assertEquals(pagination.getPp(), 1);
	        assertEquals(pagination.getP(), 1);
	        assertEquals(pagination.getS(), 11);
	        assertEquals(pagination.getE(), 15);
	        assertEquals(pagination.getN(), -1);
	        assertEquals(pagination.getNn(), -1);
	    }

	    @Test
	    void test_16_5() {
	        StudentItemDaoMock studentItemDao = new StudentItemDaoMock();

	        StudentItemService studentItemService = new StudentItemServiceImpl();
	        studentItemService.setStudentItemDao(studentItemDao);

	        Pagination pagination = studentItemService.getPagination(16, 5);
	        assertEquals(pagination.getC(), 15);
	        assertEquals(pagination.getPp(), 1);
	        assertEquals(pagination.getP(), 1);
	        assertEquals(pagination.getS(), 11);
	        assertEquals(pagination.getE(), 15);
	        assertEquals(pagination.getN(), -1);
	        assertEquals(pagination.getNn(), -1);
	    }

	    @Test
	    void test_20_5() {
	        StudentItemDaoMock studentItemDao = new StudentItemDaoMock();

	        StudentItemService studentItemService = new StudentItemServiceImpl();
	        studentItemService.setStudentItemDao(studentItemDao);

	        Pagination pagination = studentItemService.getPagination(20, 5);
	        assertEquals(pagination.getC(), 15);
	        assertEquals(pagination.getPp(), 1);
	        assertEquals(pagination.getP(), 1);
	        assertEquals(pagination.getS(), 11);
	        assertEquals(pagination.getE(), 15);
	        assertEquals(pagination.getN(), -1);
	        assertEquals(pagination.getNn(), -1);
	    }

	    @Test
	    void test_20_10000() {
	        StudentItemDaoMock studentItemDao = new StudentItemDaoMock();

	        StudentItemService studentItemService = new StudentItemServiceImpl();
	        studentItemService.setStudentItemDao(studentItemDao);

	        Pagination pagination = studentItemService.getPagination(20, 10000);
	        assertEquals(pagination.getC(), 1);
	        assertEquals(pagination.getPp(), -1);
	        assertEquals(pagination.getP(), -1);
	        assertEquals(pagination.getS(), 1);
	        assertEquals(pagination.getE(), 1);
	        assertEquals(pagination.getN(), -1);
	        assertEquals(pagination.getNn(), -1);
	    }

	    @Test
	    void test_20_1() {
	        StudentItemDaoMock studentItemDao = new StudentItemDaoMock();

	        StudentItemService studentItemService = new StudentItemServiceImpl();
	        studentItemService.setStudentItemDao(studentItemDao);

	        Pagination pagination = studentItemService.getPagination(21, 1);
	        assertEquals(pagination.getC(), 21);
	        assertEquals(pagination.getPp(), 1);
	        assertEquals(pagination.getP(), 11);
	        assertEquals(pagination.getS(), 21);
	        assertEquals(pagination.getE(), 30);
	        assertEquals(pagination.getN(), 31);
	        assertEquals(pagination.getNn(), 71);
	    }

//	    // StudentItemDaoMock totalcount°¡ 200ÀÏ ¶§ 
//	    @Test
//	    void test_20_3() {
//	        StudentItemDaoMock studentItemDao = new StudentItemDaoMock();
	//
//	        StudentItemService studentItemService = new StudentItemServiceImpl();
//	        studentItemService.setStudentItemDao(studentItemDao);
	//
//	        Pagination pagination = studentItemService.getPagination(20, 3);
//	        assertEquals(pagination.getC(), 20);
//	        assertEquals(pagination.getPp(), 1);
//	        assertEquals(pagination.getP(), 1);
//	        assertEquals(pagination.getS(), 11);
//	        assertEquals(pagination.getE(), 20);
//	        assertEquals(pagination.getN(), 21);
//	        assertEquals(pagination.getNn(), 61);
//	    }
	}