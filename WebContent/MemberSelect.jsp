<%@page import="db.MemberBean"%><%@page import="java.util.Vector"%><%@page import="db.MemberDao"%><%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%><?xml version="1.0" encoding="utf-8"?>
<member>
<%
	MemberDao mdao = new MemberDao();
	Vector<MemberBean> vec = mdao.getAllMember();
	//�ݺ����� ���鼭 ȸ�������� ������
	for(int i=0 ; i<vec.size() ; i++){
		MemberBean bean= vec.get(i);
	
%>
	<item>
		<id><%=bean.getId()%></id>
		<pass><%=bean.getId()%></pass>
		<name><%=bean.getId()%></name>
	</item>
<% }	%>
</member>			