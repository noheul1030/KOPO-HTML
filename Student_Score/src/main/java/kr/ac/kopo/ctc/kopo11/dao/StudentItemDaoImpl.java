package kr.ac.kopo.ctc.kopo11.dao;

import java.sql.*;
import java.util.*;
import kr.ac.kopo.ctc.kopo11.domain.StudentItem;
import kr.ac.kopo.ctc.kopo11.dto.Pagination;
import kr.ac.kopo.ctc.kopo11.service.StudentItemService;
import kr.ac.kopo.ctc.kopo11.service.StudentItemServiceImpl;

public class StudentItemDaoImpl implements StudentItemDao{
	String driver = "com.mysql.cj.jdbc.Driver";
	String connection = "jdbc:mysql://localhost:3307/kopo11";
	String root = "root";
	String password = "shdmf1030@";
	
	@Override // 1. table 생성
	public void createTable() {
        try {
	    	Class.forName(driver);
	    	Connection conn = DriverManager.getConnection(connection, root,password);
	    	Statement stmt = conn.createStatement();
	        stmt.execute("drop table if exists jspDB;");
	        
	        String sql = "create table jspDB(" 
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
	
	@Override // 2. table 완전삭제
	public void dropTable(){

        try {
        	Class.forName(driver);
        	Connection conn = DriverManager.getConnection(connection, root, password); 
        	Statement stmt = conn.createStatement();
        	stmt.execute("drop table if exists jspDB;");
        	
        }catch(ClassNotFoundException | SQLException e) {
        	System.out.println(e);
        }
	}
	
	@Override // 3. 컬럼 삭제
	public boolean delete(){
		try {
		Class.forName(driver);
        Connection conn = DriverManager.getConnection(connection, root, password);
        Statement stmt = conn.createStatement();
        
        stmt.execute("truncate jspDB;");
		}catch(ClassNotFoundException | SQLException e) {
			System.out.println(e);
			return false;
		}
		return true;
	}
	

	@Override // 4. 컬럼 값 insert
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

				String insertQuery = String.format("insert into jspDB ("
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
	
	
	// 5. 컬럼 값 수정 update // oneviewDB의 key를 받아서 하는 방법을 참고하자
	@Override
	public StudentItem update(int kor,int eng,int mat, int studentid) {
		StudentItem item = new StudentItem();
		try {
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(connection, root, password);
			Statement stmt = conn.createStatement();
			String updateQuery = String.format("update jspDB set kor = %d,eng = %d,mat = %d where studentid = %d",
					kor,eng,mat,studentid);
			stmt.execute(updateQuery);
			
			stmt.close(); 
			conn.close(); 
		}catch(ClassNotFoundException | SQLException e) {
			System.out.println(e);
		}
		return item;
	}
		
	@Override // 6. 새로운 컬럼 값 insert(1건)
	public StudentItem newinsert(String name) {
		StudentItem item = new StudentItem();
		try {
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(connection, root, password);
			Statement stmt = conn.createStatement();
			int count = count()-1;
	        String selectQuery = String.format("select * from jspDB limit %d,1 ;",count);
	        ResultSet rset = stmt.executeQuery(selectQuery);
	        
        	item.setName(name);
        	while(rset.next()) {
        	item.setStudentid(rset.getInt(2)+1);
        	}
        	item.setKor((int) (Math.random()*101));
			item.setEng((int) (Math.random()*101));
			item.setMat((int) (Math.random()*101));    	
	        	        
			String newinsertQuery = String.format("insert into jspDB ("
					+ "name,studentid,kor,eng,mat)"
					+ "values ('%s',%d,%d,%d,%d);",
					item.getName(),item.getStudentid(),item.getKor(),item.getEng(),item.getMat());
			
			stmt.execute(newinsertQuery);
						
			stmt.close(); 
			conn.close(); 
		}catch(Exception e) {
			System.out.println(e);
		}
		return item;
	}
	

	@Override // 7. table 한건 조회
	public StudentItem selectOne(int id) {
		StudentItem item = new StudentItem();
		try {
			Class.forName(driver);
	    	Connection conn = DriverManager.getConnection(connection, root,password);
	    	Statement stmt = conn.createStatement();
	        String selectQuery = String.format("select * from jspDB where studentid = %d ;",id);
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

	

	
	@Override // 8. table 전체 조회
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
	        	        
	        String Quary = String.format("select * from (select * from jspDB limit %d,%d) as a;",a,countPerPage);
	        
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

	@Override // 9. 전체 table값 count
	public int count() {
	    int total = 0;
	    try {
	        Class.forName(driver);
	        Connection conn = DriverManager.getConnection(connection, root, password);
	        Statement stmt = conn.createStatement();
	        ResultSet settotal = stmt.executeQuery("SELECT COUNT(*) FROM jspDB;");
	        if (settotal.next()) {
	            total = settotal.getInt(1);
	        }
	    } catch (ClassNotFoundException | SQLException e) {
	        System.out.println(e);
	    }
	    return total;
	}
	
	@Override // 10. rank 지정
	public List<StudentItem> ranking() {
		  List<StudentItem> studentItemList = new ArrayList<>();
			try {
				Class.forName(driver);
		        Connection conn = DriverManager.getConnection(connection, root, password);
		        Statement stmt = conn.createStatement();
		        
		        StudentItemService studentItemService = new StudentItemServiceImpl();
		        studentItemService.setStudentItemDao(this);
		        	        
		        String Quary = String.format("select *, kor+eng+mat as sum, (kor+eng+mat)/3 as ave, row_number() over (order by kor+eng+mat desc) as ranking from jspDB;");
		        
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
	
	// 11. 방문자수 조회

}
