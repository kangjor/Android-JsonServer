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
			
			//1����̹��ε�
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//2Ŀ�ؼ� ��ü ����
			con = DriverManager.getConnection(oraURL,oraID,oraPASS);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//��� ȸ���� ���� ������ ���ͼ� �������ִ� �޼ҵ� �ϳ� ����
	public Vector<MemberBean> getAllMember(){
		//��� ȸ���� ���� ������ ����
		Vector<MemberBean> vec =new Vector<>();
		
		try {
			//��� ����
			con();
			//�����غ�
			String sql="select * from androidmember";
			//���� ����
			PreparedStatement pstmt = con.prepareStatement(sql);
			//���������� ��������� ����
			ResultSet rs = pstmt.executeQuery();
			//�ݺ����� ���鼭 �����͸� �����Ͽ� ���Ϳ� ����
			while(rs.next()){
				MemberBean bean = new MemberBean();
				bean.setId(rs.getString(1));
				bean.setPass(rs.getString(2));
				bean.setName(rs.getString(3));
				//���� ���Ϳ� ����
				vec.add(bean);		
			}		
			con.close();rs.close();pstmt.close();			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vec;
	}
	

}














