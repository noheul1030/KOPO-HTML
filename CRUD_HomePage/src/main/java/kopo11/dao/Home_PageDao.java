package kopo11.dao;

import java.sql.*;
import java.util.List;

import kopo11.domain.Item;

public interface Home_PageDao {
	// CRUD
	
	Statement stmt();
	String date();
	int lastNumber();
	
		
	// 1. table 생성
	void createTable();

	// 9. 전체 table값 count
	int count();		
	
	// 6. 새로운 컬럼 값 insert(1건)
	void newinsert(String title, String date, String content);
	
	
	
	
	
	
	
	// 2. table 완전삭제
	void dropTable();		
	// 3. 컬럼 삭제
	boolean delete();		
		
	// 5. 컬럼 값 수정 update
	void update(String key,String title, String content);
	// 7. table 한건 조회
	ResultSet selectOne(String key);		
	
	
	// 11. 방문자수 조회


			
			
			
			
//			update
			
//			delete
}
