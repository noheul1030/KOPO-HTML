package kr.ac.kopo.ctc.kopo11.dao;

import java.util.List;

import kr.ac.kopo.ctc.kopo11.domain.StudentItem;

public interface StudentItemDao {
    // CRUD

    StudentItem create();

    StudentItem selectOne(int id);

    List<StudentItem> selectAll(int page, int countPerPage);

    int totalcount();

//      update

//      delete
}
