package kr.ac.kopo.ctc.kopo11.dao;

import java.sql.*;
import java.util.*;
import kr.ac.kopo.ctc.kopo11.domain.StudentItem;
import kr.ac.kopo.ctc.kopo11.dto.Pagination;
import kr.ac.kopo.ctc.kopo11.service.StudentItemService;
import kr.ac.kopo.ctc.kopo11.service.StudentItemServiceImpl;

public class StudentItemDaoImpl implements StudentItemDao{
	String driver = "com.mysql.cj.jdbc.Driver";
	String connection = "jdbc:mysql://localhost:3306/noheul";
	String root = "root";
	String password = "shdmf1030@";
	
	@Override
	public void createTable() {
        try {
	    	Class.forName(driver);
	    	Connection conn = DriverManager.getConnection(connection, root,password);
	    	Statement stmt = conn.createStatement();
	        stmt.execute("drop table if exists student_score;");
	        
	        String sql = "create table student_score(" 
	                + "name varchar(20)," 
	                + "studentid int not null primary key, " 
	                + "kor int, " 
	                + "eng int, " 
	                + "mat int " 
	                + ") DEFAULT CHARSET=UTF8;";
	
	        stmt.execute(sql);
	
	        stmt.close(); 
	        conn.close(); 
	       
        }catch(ClassNotFoundException | SQLException e) {
        	System.out.println(e);
        }
	}
	
	@Override
	public void dropTable(){

        try {
        	Class.forName(driver);
        	Connection conn = DriverManager.getConnection(connection, root, password); 
        	Statement stmt = conn.createStatement();
        	stmt.execute("drop table if exists student_score;");
        	
        }catch(ClassNotFoundException | SQLException e) {
        	System.out.println(e);
        }
	}
	
	
	
	
	
	
	// TBL 삭제 delete
	@Override
	public boolean delete(){
		try {
		Class.forName(driver);
        Connection conn = DriverManager.getConnection(connection, root, password);
        Statement stmt = conn.createStatement();
        
        stmt.execute("truncate student_score;");
		}catch(ClassNotFoundException | SQLException e) {
			System.out.println(e);
			return false;
		}
		return true;
	}
	

	@Override
	// C TBL 생성 insert
	public StudentItem create() { 
		StudentItem item = new StudentItem();
		try {
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(connection, root, password);
			Statement stmt = conn.createStatement();
			
			int id = 209901;
			List<String> student = new ArrayList<String>(List.of("나연","정연","모모","사나","지효","미나","다현","채영","쯔위"));
			
			int namenum = 0;
			int i = 0;
			while(i < 50) {
				if(namenum % 8 == 0) {
					namenum = 0;
				}

				item.setName(student.get(namenum));
				item.setStudentid(id+i);
				item.setKor((int) (Math.random()*101));
				item.setEng((int) (Math.random()*101));
				item.setMat((int) (Math.random()*101));

				String insertQuery = String.format("insert into student_score ("
						+ "name,studentid,kor,eng,mat)"
						+ "values ('%s',%d,%d,%d,%d);",
						item.getName(),item.getStudentid(),item.getKor(),item.getEng(),item.getMat());
				
				stmt.execute(insertQuery);
				i++;
				namenum++;
			}
			
			stmt.close(); 
			conn.close(); 
		}catch(ClassNotFoundException | SQLException e) {
			System.out.println(e);
		}
		return item;
	}
	
	
	@Override
	// R TBL 하나 조회 select
	public StudentItem selectOne(int id) {
		StudentItem item = new StudentItem();
		try {
			Class.forName(driver);
	    	Connection conn = DriverManager.getConnection(connection, root,password);
	    	Statement stmt = conn.createStatement();
	        String selectQuery = String.format("select * from student_score where studentid = %d ;",id);
	        ResultSet rset = stmt.executeQuery(selectQuery);
	        
	        while(rset.next()) {
	        	item.setName(rset.getString(1));
	        	item.setStudentid(rset.getInt(2));
	        	item.setKor(rset.getInt(3));
	        	item.setEng(rset.getInt(4));
	        	item.setMat(rset.getInt(5));     	
	        }
	        
	        stmt.close(); 
	        conn.close(); 
		}catch(ClassNotFoundException | SQLException e) {
			System.out.println(e);
		}
		
		return item;
	}

	// R TBL 전체 조회 select *
	@Override
	   public List<StudentItem> selectAll(int page, int countPerPage) {
	      List<StudentItem> studentItemList = new ArrayList<>();
		try {
			Class.forName(driver);
	        Connection conn = DriverManager.getConnection(connection, root, password);
	        Statement stmt = conn.createStatement();
	        
	        StudentItemService studentItemService = new StudentItemServiceImpl();
	        studentItemService.setStudentItemDao(this);
	        
	       Pagination pagination = studentItemService.getPagination(page,countPerPage); 
	        
	        int a = (pagination.getC()-1)*countPerPage;
	        	        
	        String Quary = String.format("select * from (select * from student_score limit %d,%d) as a;",a,countPerPage);
	        
	        ResultSet rset = stmt.executeQuery(Quary);
	        
	        while(rset.next()) {
	        	StudentItem item = new StudentItem();
	        	
	        	item.setName(rset.getString(1));
	        	item.setStudentid(rset.getInt(2));
	        	item.setKor(rset.getInt(3));
	        	item.setEng(rset.getInt(4));
	        	item.setMat(rset.getInt(5));     	
	        	
	        	studentItemList.add(item);
	        }
	               
	        stmt.close(); 
	        conn.close(); 
        }catch(Exception e) {
        	e.printStackTrace();
        }
		
		return studentItemList;
	}

	@Override
	public int count() {
	    int total = 0;
	    try {
	        Class.forName(driver);
	        Connection conn = DriverManager.getConnection(connection, root, password);
	        Statement stmt = conn.createStatement();
	        ResultSet settotal = stmt.executeQuery("SELECT COUNT(*) FROM student_score;");
	        if (settotal.next()) {
	            total = settotal.getInt(1);
	        }
	    } catch (ClassNotFoundException | SQLException e) {
	        System.out.println(e);
	    }
	    return total;
	}

}
