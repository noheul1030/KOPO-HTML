package kr.ac.kopo05.dao;

import java.sql.SQLException;
import java.util.List;

import kr.ac.kopo05.domain.StudentItem;

public interface StudentItemDao {
	// CRUD
	
	int createTable();
	
	int dropTable();
	
	int createRandomData30();
	
	int deleteData(int studentid);
	
	int updateData(String name, int student_id, int kor, int eng, int mat);
	
	void createNewData() throws ClassNotFoundException, SQLException;
	
	int insertOneData(String name, int kor, int eng, int mat) throws ClassNotFoundException, SQLException;
	
	StudentItem selectOne(int id) throws ClassNotFoundException, SQLException;
	
	List<StudentItem> selectAll(int page, int countPerPage) throws ClassNotFoundException, SQLException;
	
	int count() throws ClassNotFoundException, SQLException;
	
	int getRank(int studentid) throws ClassNotFoundException, SQLException;
	
	String countvisit() throws ClassNotFoundException, SQLException;
	
//	update
	
//	delete
}
