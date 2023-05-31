package kr.ac.kopo.ctc.kopo11.dao;

import java.util.List;

import kr.ac.kopo.ctc.kopo11.domain.StudentItem;

public interface StudentItemDao {
	// CRUD
		// 1. table 생성
		void  createTable();
		// 2. table 완전삭제
		void dropTable();		
		// 3. 컬럼 삭제
		boolean delete();		
		// 4. 컬럼 값 insert
		StudentItem create();		
		// 5. 컬럼 값 수정 update
		StudentItem update(int kor, int eng, int mat, int studentid);
		// 6. 새로운 컬럼 값 insert(1건)
		StudentItem newinsert(String name);
		// 7. table 한건 조회
		StudentItem selectOne(int id);		
		// 8. table 전체 조회
		List<StudentItem> selectAll(int page, int countPerPage);		
		// 9. 전체 table값 count
		int count();		
		// 10. rank 지정
		List<StudentItem> ranking();
		
		// 11. 방문자수 조회


		
		
		
		
//		update
		
//		delete
}
