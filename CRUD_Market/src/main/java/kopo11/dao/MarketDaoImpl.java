package kopo11.dao;

import java.sql.*;

public class MarketDaoImpl implements MarketDao{
	String driver = "com.mysql.cj.jdbc.Driver";
	String connection = "jdbc:mysql://localhost:3307/kopo11";
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
	
	// 마지막 ID
	public int lastID() {
		int lastNumber = 122122;
		try {
			if(count()!=0) {
				ResultSet rset = stmt().executeQuery("select number from market order by number desc;");
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
	
	public int middleID() {
		int lastNumber = 122122;
		try {
			if(count()!=0) {
	        // 해당 칼럼의 최소값을 찾는 쿼리문 실행 결과값 저장
				ResultSet rset = stmt().executeQuery("select min(id) as minNum from market where (id+1) not in (select id from market);");
				while(rset.next()) {
					lastNumber = rset.getInt(1)+1;
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
	        String sql = "create table if not exists market(" 
	                + "id int not null primary key," 
	                + "name varchar(20), " 
	                + "inventoryCNT int, " 
	                + "inventoryCheck date, "
	                + "inventoryUpdate date, "
	                + "content text, "
	                + "picture text"
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
					("select count(*) from market;");
			
			ResultSet rset = stmt().executeQuery(sql);
			while(rset.next()) {
				count = rset.getInt(1);
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		return count;
	}
	
	
	@Override
	public void insert(int id, String name, int inventoryCNT, String inventoryCheck, 
			String inventoryUpdate,String text, String picture) {
		
		try {			
			String sql = String.format
					("insert into market (id,name,inventoryCNT,inventoryCheck,inventoryUpdate,content,picture)"
							+ " values (%d,'%s',%d,'%s','%s','%s','%s');",
							id,name,inventoryCNT,inventoryCheck,inventoryUpdate,text,picture);
			
			stmt().execute(sql);
		}catch(Exception e) {
			System.out.println(e);
		}
	}
	
	
	@Override // 4. 컬럼 삭제
	public void delete(int id) {
		try {
			String Query = String.format("delete from market where number = %d;",id);
			stmt().execute(Query);
		}catch(Exception e) {
			System.out.println(e);
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	@Override // 3. 공지번호,제목,날짜,내용 값 저장
	public void newinsert(String title, String date, String content) {
		try {			
			String sql = String.format
					("insert into market (title,date,content) values ('%s','%s','%s');",title,date,content);
			
			stmt().execute(sql);
		}catch(Exception e) {
			System.out.println(e);
		}
	}
	

	@Override // 5. 컬럼 값 수정 update
	public void update(int number,String title, String content) {
		try {
			String Query = String.format("update market set title = '%s',date = '%s',content = '%s' where number = %d;",
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
			String Query = String.format("select * from market where title = '%s';",key);
			rset = stmt().executeQuery(Query);
		}catch(Exception e) {
			System.out.println(e);
		}
		return rset;
	}

	
	
}
