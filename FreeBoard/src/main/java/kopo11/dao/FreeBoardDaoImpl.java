package kopo11.dao;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FreeBoardDaoImpl implements FreeBoardDao{
	String driver = "com.mysql.cj.jdbc.Driver";
//	String connection = "jdbc:mysql://localhost:3307/kopo11";
	String connection = "jdbc:mysql://localhost:3306/noheul";
	String root = "root";
	String password = "shdmf1030@";
	
	// DB연동
	public Statement stmt() {
		Connection conn;
		Statement stmt = null;
		try {
		Class.forName(driver);
    	conn = DriverManager.getConnection(connection, root,password);
    	stmt = conn.createStatement();
    	
		}catch(Exception e){
			System.out.println(e);
		}
		return stmt;
	}
	
	// Date 정보 조회
	public String date() {
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		Date d = new Date();

		return sd.format(d);
	}
	
	// 마지막 게시글
	public int lastNumber() {
		Integer lastNumber = 1;
		try {
			if(count()!=0) {
				ResultSet rset = stmt().executeQuery("select id from freeboard order by id desc;");
				while(rset.next()) {
					lastNumber = rset.getInt(1)+1;
					break;
				}
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		return lastNumber;
	}

	@Override // 1. table 생성
	public void createTable() {
        try {
	        String sql = "create table if not exists freeboard(" 
	                + "id int not null primary key auto_increment," 
	                + "title varchar(70), "
	                + "date date, " 
	                + "content text, "
	                + "rootid int, "
	                + "relevel int, "
	                + "recnt int, "
	                + "viewcnt int"
	                + ") DEFAULT CHARSET=UTF8;";
	
	        stmt().execute(sql);
	       
        }catch(Exception e) {
        	System.out.println(e);
        }
	}

	
	@Override // 2. 전체 table값 count
	public int count() {
		Integer count = null;
		try {
			String sql = String.format
					("select count(*) from freeboard;");
			
			ResultSet rset = stmt().executeQuery(sql);
			while(rset.next()) {
				count = rset.getInt(1);
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		return count;
	}

	@Override // 3. 공지번호,제목,날짜,내용 값 저장
	public void newinsert(String title, String date, String content) {
		try {			
			String sql = String.format
					("insert into freeboard (title,date,content,viewcnt) values ('%s','%s','%s',%d);",title,date,content,0);
			
			stmt().execute(sql);
		}catch(Exception e) {
			System.out.println(e);
		}
	}
	
	@Override // 4. 컬럼 삭제
	public void delete(int number) {
		try {
			String Query = String.format("delete from freeboard where id = %d;",number);
			stmt().execute(Query);
		}catch(Exception e) {
			System.out.println(e);
		}
	}

	@Override // 5. 컬럼 값 수정 update
	public void update(int number,String title, String content) {
		try {
			String Query = String.format("update freeboard set title = '%s',date = '%s',content = '%s' where id = %d;",
					title,date(),content,number);
			stmt().execute(Query);
		}catch(Exception e) {
			System.out.println(e);
		}
		
	}


	@Override // 6. table 한건 조회
	public ResultSet selectOne(String key) {
		ResultSet rset= null;
		try {
			String Query = String.format("select * from freeboard where id = '%s';",key);
			rset = stmt().executeQuery(Query);
		}catch(Exception e) {
			System.out.println(e);
		}
		return rset;
	}

	@Override
	public void visit(String key) {
		Integer count = null;
		try {
			String query = String.format("select viewcnt from freeboard where id = '%s'",key);
			ResultSet rset = stmt().executeQuery(query);
			while(rset.next()) {
				count = rset.getInt(1)+1;
			}
			String Query = String.format("update freeboard set viewcnt = %d where id = '%s'" ,count,key);
			stmt().execute(Query);
		}catch(Exception e) {
			System.out.println(e);
		}
	}

	
	
}
