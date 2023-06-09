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
	
	// 4. 컬럼 삭제
	void delete(String id);		
	// 6. table id 한건 조회
	ResultSet selectOne(String key);		
	
	
	
	
	
	
	
	
	
	
	
	
		
	// 5. 컬럼 값 수정 update
	void update(int key,int inventoryCNT);
	
	

			
			
			
			
//			update
			
//			delete
}
