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
		//�ѱ�ó��
		request.setCharacterEncoding("euc-kr");
		//�Ķ���� ���� �о��
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
			
		//System.out.println("Data===== " +id);
		String oraID="system";
		String oraPASS="123456";
		String oraURL="jdbc:oracle:thin:@localhost:1521:XE";
		//������ ���̽� ����
		try{
			//1����̹��ε�
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//2Ŀ�ؼ� ��ü ����
			Connection con = DriverManager.getConnection(oraURL,oraID,oraPASS);
			//�����ۼ�
			String sql="insert into androidmember values(?,?,?)";
			//3������ ��������� preparedstatement ��ü ����
			PreparedStatement pstmt = con.prepareStatement(sql);
			//?�� ���� ����
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			pstmt.setString(3, name);
			//���� �����Ͻÿ�
			pstmt.executeUpdate();
			//�ڿ� �ݳ�
			pstmt.close(); con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
	%>

</body>
</html>














