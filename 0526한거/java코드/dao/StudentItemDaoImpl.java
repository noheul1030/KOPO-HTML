package kr.ac.kopo05.dao;

import java.io.FileReader;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo05.domain.StudentItem;

public class StudentItemDaoImpl implements StudentItemDao {

	@Override
	public int createTable() {
		int checkerror = 0;
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");  // JDBC 드라이버
		Connection k05_conn = DriverManager.getConnection("jdbc:mysql://192.168.23.54:3306/kopo05", "root" , "1234"); 
		// JDBC드라이버를 이용해서 user와 password를 입력해 데이터베이스에 접근
		Statement k05_stmt = k05_conn.createStatement(); // JDBC에 입력할 객체를 생성
		k05_stmt.execute("create table student_grade(" + "studentid int not null primary key,"+ "name varchar(50),"
				+ "kor int," +"eng int,"+ "mat int)"
				+ "DEFAULT CHARSET=utf8;");
		// grades라는 table을 (fieldname  저장형태)의 형식으로 table 생성

		k05_stmt.close(); // 에러가 발생하지않기 위해 객체닫기
		k05_conn.close(); // 에러가 발생하지않기 위해 연결끊기
		} catch (Exception e) {
			checkerror = 1;
		}
		
		return checkerror;



	}


	@Override
	public int dropTable(){
		int checkerror = 0;
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");  // JDBC 드라이버
		Connection k05_conn = DriverManager.getConnection("jdbc:mysql://192.168.23.54:3306/kopo05", "root" , "1234"); 
		// JDBC드라이버를 이용해서 user와 password를 입력해 데이터베이스에 접근
		Statement k05_stmt = k05_conn.createStatement(); // JDBC에 입력할 객체를 생성

		k05_stmt.execute("drop table student_grade;");	
		// drop table tablename 명령어를 통해서 table자체를 삭제
		// table자체를 삭제하기때문에 data도 같이삭제

		k05_stmt.close(); // 에러가 발생하지않기 위해 객체닫기
		k05_conn.close(); // 에러가 발생하지않기 위해 연결끊기
		} catch (Exception e) {
			checkerror = 1;
		}
		return checkerror;
	}


	@Override
	public int createRandomData30(){
		int checkerror = 0;
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");  // JDBC 드라이버
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.54:3306/kopo05", "root" , "1234"); 
		// JDBC드라이버를 이용해서 user와 password를 입력해 데이터베이스에 접근
		Statement stmt = conn.createStatement(); // JDBC에 입력할 객체를 생성

		String name = ""; // 이름을 저장해줄 변수
		String QueryTxt = " "; // mysql에 명령해줄 명령어 저장변수
		int kor; // 국어점수
		int eng; // 영어점수
		int mat; // 수학점수
		int id = 209901; // Line을 세줄 변수 선언
		for(int i = 1; i <= 30; i++) {
			name = String.format("홍길동%02d",i); // 홍길동1, 홍길동2 .... 
			kor = (int)(Math.random() *101); // 점수를 0~100점까지 랜덤하게 뽑아냄
			eng = (int)(Math.random() *101); // 점수를 0~100점까지 랜덤하게 뽑아냄
			mat = (int)(Math.random() *101); // 점수를 0~100점까지 랜덤하게 뽑아냄

			QueryTxt = String.format("insert into student_grade(" + "name," + "studentid,"
					+ "kor," +"eng,"+ "mat)"
					+ "values(" +"'%s','%s','%s','%s','%s');",
					name, id, kor, eng, mat);
			// mysql에 입력할 문구를 작성하는 과정
			// table의 형태와 맞게 table(fieldname1,..... ,fieldname10) valuse(value1,......value10)이런형태로
			// data를 table에 insert into 명령어로 저장하기 위해 명령어를 저장
			stmt.execute(QueryTxt); // mysql에 명령어를전달해 실행
			// 저장될때마다 몇번째 항목을 저장한지와 저장한 내용을 출력
			id++;
		}	
		stmt.close(); // 에러가 발생하지않기 위해 객체닫기
		conn.close(); // 에러가 발생하지않기 위해 연결끊기 
		} catch (Exception e) {
			checkerror = 1;
		}
		return checkerror;
	}


	@Override
	public int deleteData(int studentid){
		int checkerror = 0;
		try {
		List<StudentItem> stList = new ArrayList<StudentItem>();
		Class.forName("com.mysql.cj.jdbc.Driver");  // JDBC 드라이버
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.54:3306/kopo05", "root" , "1234"); 
		// JDBC드라이버를 이용해서 user와 password를 입력해 데이터베이스에 접근
		Statement stmt = conn.createStatement(); // JDBC에 입력할 객체를 생성
		String QueryTxt = " ";
		QueryTxt = String.format("DELETE FROM student_grade WHERE studentid='%s';",studentid);
		stmt.execute(QueryTxt);
	} catch (Exception e) {
		checkerror = 1;
	}
	return checkerror;



	}


	@Override
	public int updateData(String name, int student_id, int kor, int eng, int mat){
		int checkerror = 0;
		try {
		List<StudentItem> stList = new  ArrayList<StudentItem>();
		Class.forName("com.mysql.cj.jdbc.Driver");  // JDBC 드라이버
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.54:3306/kopo05", "root" , "1234"); 
		// JDBC드라이버를 이용해서 user와 password를 입력해 데이터베이스에 접근
		Statement stmt = conn.createStatement(); // JDBC에 입력할 객체를 생성
		String QueryTxt = " "; // mysql에 명령해줄 명령어 저장변수
		QueryTxt = String.format("UPDATE student_grade SET name='%s', kor='%s', eng='%s', mat='%s'  WHERE studentid='%s';"
				,name,kor,eng,mat,student_id);	
		stmt.execute(QueryTxt);
		} catch (Exception e) {
			checkerror = 1;
		}
		return checkerror;
	}


	@Override
	public void createNewData() throws ClassNotFoundException, SQLException{
		// TODO Auto-generated method stub

	}


	@Override
	public StudentItem selectOne(int id) throws ClassNotFoundException, SQLException{
		StudentItem studentItem = new StudentItem();

		Class.forName("com.mysql.cj.jdbc.Driver");  // JDBC 드라이버
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.54:3306/kopo05", "root" , "1234"); 
		// JDBC드라이버를 이용해서 user와 password를 입력해 데이터베이스에 접근
		Statement stmt = conn.createStatement(); // JDBC에 입력할 객체를 생성		
		ResultSet rset = stmt.executeQuery("select * from student_grade where studentid =" + id); // 명령어를 통해 나오는값을 rset에 저장
		rset.next();
		studentItem.setStudentid(rset.getInt(1));
		studentItem.setName(rset.getString(2));
		studentItem.setKor(rset.getInt(3));
		studentItem.setEng(rset.getInt(4));
		studentItem.setMat(rset.getInt(5));	

		return studentItem;
	}


	@Override
	public List<StudentItem> selectAll(int page, int countPerPage) throws ClassNotFoundException, SQLException{
		List<StudentItem> studentItemList = new ArrayList<StudentItem>();
		Class.forName("com.mysql.cj.jdbc.Driver");  // JDBC 드라이버
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.54:3306/kopo05", "root" , "1234"); 
		// JDBC드라이버를 이용해서 user와 password를 입력해 데이터베이스에 접근
		Statement stmt = conn.createStatement(); // JDBC에 입력할 객체를 생성		
		ResultSet rset = stmt.executeQuery("select * from student_grade"); // 명령어를 통해 나오는값을 rset에 저장
		while(rset.next()) {
			StudentItem studentItem = new StudentItem();
			studentItem.setStudentid(rset.getInt(1));
			studentItem.setName(rset.getString(2));
			studentItem.setKor(rset.getInt(3));
			studentItem.setEng(rset.getInt(4));
			studentItem.setMat(rset.getInt(5));

			studentItemList.add(studentItem);
		}

		return studentItemList;
	}


	@Override
	public int count() throws ClassNotFoundException, SQLException{
		int count = 0;

		Class.forName("com.mysql.cj.jdbc.Driver");  // JDBC 드라이버
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.54:3306/kopo05", "root" , "1234"); 
		// JDBC드라이버를 이용해서 user와 password를 입력해 데이터베이스에 접근
		Statement stmt = conn.createStatement(); // JDBC에 입력할 객체를 생성		
		ResultSet rset = stmt.executeQuery("select count(*) from student_grade"); // 명령어를 통해 나오는값을 rset에 저장
		rset.next();
		count = rset.getInt(1);

		return count;
	}


	@Override
	public int insertOneData(String name, int kor, int eng, int mat) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");  // JDBC 드라이버
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.54:3306/kopo05", "root" , "1234"); 
		// JDBC드라이버를 이용해서 user와 password를 입력해 데이터베이스에 접근
		Statement stmt = conn.createStatement(); // JDBC에 입력할 객체를 생성
		ResultSet rset = stmt.executeQuery("select studentid from student_grade;"); // 명령어를 통해 나오는값을 rset에 저장
		String QueryTxt = " "; // mysql에 명령해줄 명령어 저장변수
		List<Integer> studentIdList = new ArrayList<Integer>();
		while(rset.next()) {
			studentIdList.add(rset.getInt(1));
		}
		int id = 209901;
		for(int checkId : studentIdList) {
			if(checkId != id) {
				break;
			}
			id++;
		}

		QueryTxt = String.format("insert into student_grade(" + "name," + "studentid,"
				+ "kor," +"eng,"+ "mat)"
				+ "values(" +"'%s','%s','%s','%s','%s');",
				name, id, kor, eng, mat);
		stmt.execute(QueryTxt); // mysql에 명령어를전달해 실행
		// 저장될때마다 몇번째 항목을 저장한지와 저장한 내용을 출력

		stmt.close(); // 에러가 발생하지않기 위해 객체닫기
		conn.close(); // 에러가 발생하지않기 위해 연결끊기 

		return id;

	}


	@Override
	public int getRank(int studentid) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");  // JDBC 드라이버
		Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.54:3306/kopo05", "root" , "1234"); 
		// JDBC드라이버를 이용해서 user와 password를 입력해 데이터베이스에 접근
		Statement stmt = conn.createStatement(); // JDBC에 입력할 객체를 생성
		ResultSet rset = stmt.executeQuery("select (select count(*) + 1 from student_grade "
				+ "where (a.kor+a.eng+a.mat) < (kor + eng + mat))"
				+ " from student_grade as a where studentid = " + studentid); // 명령어를 통해 나오는값을 rset에 저장
		rset.next();
		int rank = rset.getInt(1);
		return rank;
	}


	@Override
	public String countvisit() throws ClassNotFoundException, SQLException {
		String data = "";
		int cnt = 0;
		try {
			FileReader fl = new FileReader("C:\\\\Users\\\\KBH\\\\Desktop\\\\JSP_workspace\\\\JSP\\\\src\\\\main\\\\webapp\\\\JSP03\\\\cnt.txt");
			StringBuffer sb = new StringBuffer();
			int ch = 0;

			while ((ch = fl.read()) != -1) {
				sb.append((char) ch);
			}
			data = sb.toString().trim().replace("\n", "");
			fl.close();

			cnt = Integer.parseInt(data);
			cnt++;
			data = Integer.toString(cnt);

			FileWriter fl2 = new FileWriter("C:\\\\Users\\\\KBH\\\\Desktop\\\\JSP_workspace\\\\JSP\\\\src\\\\main\\\\webapp\\\\JSP03\\\\cnt.txt");
			fl2.write(data);
			fl2.close();

		} catch (Exception e) {

		}
		return data;
	}

}



