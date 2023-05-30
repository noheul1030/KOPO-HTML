package kr.ac.kopo.ctc.kopo11.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;
import java.util.List;

import org.junit.jupiter.api.Test;

import kr.ac.kopo.ctc.kopo11.domain.StudentItem;

class StudentItemDaoTest {

	@Test
	void test_createTable() {
		StudentItemDao studentItemDao = new StudentItemDaoImpl();
		studentItemDao.createTable();
	}
	@Test
	void test_dropTable() {
		StudentItemDao studentItemDao = new StudentItemDaoImpl();
		studentItemDao.dropTable();
	}
	@Test
	void test_delete() {
		StudentItemDao studentItemDao = new StudentItemDaoImpl();
		studentItemDao.delete();
	}
	
	@Test
	void test_create(){
		StudentItemDao studentItemDao = new StudentItemDaoImpl();
		studentItemDao.create();
	}
	
	@Test
	void test_update(){
		StudentItemDao studentItemDao = new StudentItemDaoImpl();
		StudentItem studentupdate = studentItemDao.update(50, 50, 50, 209901);
	}

	@Test
	void test_selectOne(){
		StudentItemDao studentItemDao = new StudentItemDaoImpl();
		StudentItem studentItem = studentItemDao.selectOne(209905);
		
		assertEquals(studentItem.getName(),"지효");
		assertEquals(studentItem.getKor(),87);
		assertEquals(studentItem.getEng(),75);
		assertEquals(studentItem.getMat(),45);
	}
	@Test
	void test_selectAll(){
		StudentItemDao studentItemDao = new StudentItemDaoImpl();
		List<StudentItem> studentItemList = studentItemDao.selectAll(3, 2);
		StudentItem studentItem = studentItemList.get(1);
		
		assertEquals(studentItem.getName(),"미나");
	}
	
		 
	
	@Test
	void test_totalcount() {
	    StudentItemDao studentItemDao = new StudentItemDaoImpl();
	    int num = studentItemDao.count();
	    assertEquals(50, num);
	}


}
