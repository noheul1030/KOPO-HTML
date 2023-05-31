package kr.ac.kopo.ctc.kopo11.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;
import java.util.List;

import org.junit.jupiter.api.Test;

import kr.ac.kopo.ctc.kopo11.domain.StudentItem;

class StudentItemDaoTest {

	@Test // 1. table 생성
	void test_createTable() {
		StudentItemDao studentItemDao = new StudentItemDaoImpl();
		studentItemDao.createTable();
	}
	@Test // 2. table 완전삭제
	void test_dropTable() {
		StudentItemDao studentItemDao = new StudentItemDaoImpl();
		studentItemDao.dropTable();
	}
	@Test // 3. 컬럼 삭제
	void test_delete() {
		StudentItemDao studentItemDao = new StudentItemDaoImpl();
		studentItemDao.delete();
	}
	 
	@Test // 4. 컬럼 값 insert
	void test_create(){
		StudentItemDao studentItemDao = new StudentItemDaoImpl();
		studentItemDao.create();
	}
	
	@Test // 5. 컬럼 값 수정 update
	void test_update(){
		StudentItemDao studentItemDao = new StudentItemDaoImpl();
		studentItemDao.update(50, 50, 50, 209901);
	}
	
	@Test // 6. 새로운 컬럼 값 insert(1건)
	void test_newinsert(){
		StudentItemDao studentItemDao = new StudentItemDaoImpl();
		studentItemDao.newinsert("노을");
	}

	@Test // 7. table 한건 조회
	void test_selectOne(){
		StudentItemDao studentItemDao = new StudentItemDaoImpl();
		StudentItem studentItem = studentItemDao.selectOne(209905);
		
		assertEquals(studentItem.getName(),"지효");
		assertEquals(studentItem.getKor(),87);
		assertEquals(studentItem.getEng(),75);
		assertEquals(studentItem.getMat(),45);
	}
	
	@Test // 8. table 전체 조회
	void test_selectAll(){
		StudentItemDao studentItemDao = new StudentItemDaoImpl();
		List<StudentItem> studentItemList = studentItemDao.selectAll(3, 2);
		StudentItem studentItem = studentItemList.get(1);
		
		assertEquals(studentItem.getName(),"미나");
	}
	
	@Test // 9. 전체 table값 count
	void test_totalcount() {
	    StudentItemDao studentItemDao = new StudentItemDaoImpl();
	    int num = studentItemDao.count();
	    assertEquals(50, num);
	}
	
	@Test // 10. rank 지정
	void test_ranking(){
		StudentItemDao studentItemDao = new StudentItemDaoImpl();
		List<StudentItem> studentItemList = studentItemDao.ranking();
		StudentItem studentItem = studentItemList.get(3);
		
		assertEquals(studentItem.getName(),"노을");
	}


}
