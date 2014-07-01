<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

	<%
		//System.out.print("in jsp");
		//한글처리
		request.setCharacterEncoding("euc-kr");
		//파라미터 값을 읽어옴
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
			
		//System.out.println("Data===== " +id);
		String oraID="system";
		String oraPASS="123456";
		String oraURL="jdbc:oracle:thin:@localhost:1521:XE";
		//데이터 베이스 연결
		try{
			//1드라이버로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//2커넥션 객체 선언
			Connection con = DriverManager.getConnection(oraURL,oraID,oraPASS);
			//쿼리작성
			String sql="insert into androidmember values(?,?,?)";
			//3쿼리를 실행시켜줄 preparedstatement 객체 선언
			PreparedStatement pstmt = con.prepareStatement(sql);
			//?에 값을 대입
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			pstmt.setString(3, name);
			//쿼리 실행하시오
			pstmt.executeUpdate();
			//자원 반납
			pstmt.close(); con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
	%>

</body>
</html>














