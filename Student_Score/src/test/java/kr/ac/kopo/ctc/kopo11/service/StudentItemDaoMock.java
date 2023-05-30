package kr.ac.kopo.ctc.kopo11.service;

import java.sql.SQLException;
import java.util.List;

import kr.ac.kopo.ctc.kopo11.dao.StudentItemDao;
import kr.ac.kopo.ctc.kopo11.domain.StudentItem;

public class StudentItemDaoMock implements StudentItemDao{
	@Override
	public StudentItem create() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StudentItem selectOne(int id) {
		StudentItem studentItem = new StudentItem();
		return studentItem;
	}

	@Override
	public List<StudentItem> selectAll(int page, int countPerPage) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 75;
	}

	@Override
	public void createTable() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void dropTable(){
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean delete(){
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public StudentItem update(int kor, int eng, int mat, int studentid) {
		// TODO Auto-generated method stub
		return null;
	}
}
