package kr.ac.kopo.ctc.kopo11.dao;

import java.util.List;

import kr.ac.kopo.ctc.kopo11.domain.StudentItem;

public interface StudentItemDao {
	// CRUD
		// table 생성
		void  createTable();
		// table 완전삭제
		void dropTable();
		
		// table 삭제
		boolean delete();
		
		// 값 insert
		StudentItem create();
		
		// table 조회
		StudentItem selectOne(int id);
		
		List<StudentItem> selectAll(int page, int countPerPage);
		
		int count();


		
		
		
		
//		update
		
//		delete
}
