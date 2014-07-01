package db;

import java.sql.*;
import java.util.Vector;

public class MemberDao {
	
	String oraID="system";
	String oraPASS="123456";
	String oraURL="jdbc:oracle:thin:@localhost:1521:XE";
	Connection con;	
	
	public void con(){
		
		try {
			
			//1드라이버로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//2커넥션 객체 선언
			con = DriverManager.getConnection(oraURL,oraID,oraPASS);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//모든 회원에 대한 정보를 얻어와서 리턴해주는 메소드 하나 선언
	public Vector<MemberBean> getAllMember(){
		//모든 회원의 대한 정보를 리턴
		Vector<MemberBean> vec =new Vector<>();
		
		try {
			//디비에 연결
			con();
			//쿼리준비
			String sql="select * from androidmember";
			//쿼리 실행
			PreparedStatement pstmt = con.prepareStatement(sql);
			//퉈리실행한 결과를리턴 받음
			ResultSet rs = pstmt.executeQuery();
			//반복문을 돌면서 데이터를 추출하여 백터에 저장
			while(rs.next()){
				MemberBean bean = new MemberBean();
				bean.setId(rs.getString(1));
				bean.setPass(rs.getString(2));
				bean.setName(rs.getString(3));
				//빈을 백터에 저장
				vec.add(bean);		
			}		
			con.close();rs.close();pstmt.close();			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vec;
	}
	

}














