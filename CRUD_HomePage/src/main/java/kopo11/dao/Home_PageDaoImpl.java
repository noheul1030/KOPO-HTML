package kopo11.dao;

import java.sql.*;

public class Home_PageDaoImpl implements Home_PageDao{
	String driver = "com.mysql.cj.jdbc.Driver";
	String connection = "jdbc:mysql://192.168.23.60:3307/kopo11";
//	String connection = "jdbc:mysql://localhost:3306/noheul";
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
		String date = null;

		try {
			ResultSet rset = stmt().executeQuery("select now()");
	
			while(rset.next()) {
				String now[] = (rset.getString(1)).split(" ");
				date = now[0];
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		return date;
	}
	
	// 마지막 게시글
	public int lastNumber() {
		Integer lastNumber = 1;
		try {
			if(count()!=0) {
				ResultSet rset = stmt().executeQuery("select number from gongji order by number desc;");
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
	        String sql = "create table if not exists gongji(" 
	                + "number int not null primary key auto_increment," 
	                + "title varchar(70), " 
	                + "date date, " 
	                + "content text"
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
					("select count(*) from gongji;");
			
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
					("insert into gongji (title,date,content) values ('%s','%s','%s');",title,date,content);
			
			stmt().execute(sql);
		}catch(Exception e) {
			System.out.println(e);
		}
	}
	
	@Override // 4. 컬럼 삭제
	public void delete(int number) {
		try {
			String Query = String.format("delete from gongji where number = %d;",number);
			stmt().execute(Query);
		}catch(Exception e) {
			System.out.println(e);
		}
	}

	@Override // 5. 컬럼 값 수정 update
	public void update(int number,String title, String content) {
		try {
			String Query = String.format("update gongji set title = '%s',date = '%s',content = '%s' where number = %d;",
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
			String Query = String.format("select * from gongji where number = '%s';",key);
			rset = stmt().executeQuery(Query);
		}catch(Exception e) {
			System.out.println(e);
		}
		return rset;
	}

	
	
}
