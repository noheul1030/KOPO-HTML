package kopo11.dao;

import java.sql.*;

public interface MarketDao {
	// CRUD
	
	// DB 연동
	Statement stmt();
	// 날짜
	String date(); 
	// 마지막 ID
	int lastID();
	// 중간에 빠진 ID
	int middleID();
	
		
	// 1. table 생성
	void createTable();

	// 2. 전체 table값 count
	int count();		
	
	void insert(int id,String name,int inventoryCNT,String inventoryCheck,String inventoryUpdate,String text,String picture);
	
	
	// 3. 공지번호,제목,날짜,내용 값 저장
	void newinsert(String title, String date, String content);
	
	// 4. 컬럼 삭제
	void delete(int number);		
		
	// 5. 컬럼 값 수정 update
	void update(int number,String title, String content);
	
	// 6. table 한건 조회
	ResultSet selectOne(String key);		
	

			
			
			
			
//			update
			
//			delete
}
