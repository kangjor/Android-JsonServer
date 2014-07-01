<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="org.json.simple.*" %>

<%
	// 서버로 부터 넘어온 데이터를 받아옴
	String recvMessage = request.getParameter("msg");

	System.out.print("msg : " +recvMessage);
	//전체를 담아줄 객체를 설정
	JSONObject jsonMain = new JSONObject();
	JSONArray jArray = new JSONArray();
	
	//하나의 정보를 저장할 JSONObject를 설정
	JSONObject jObject = new JSONObject();
	//데이터를 삽입
	jObject.put("id", recvMessage);
	jObject.put("pass", "1234");
	jObject.put("name", "이병학");
	//JSONArray배열객체에 하나의 JSONObject를 저장
	jArray.add(0, jObject);

	jObject = new JSONObject();
	//데이터를 삽입
	jObject.put("id", recvMessage);
	jObject.put("pass", "5678");
	jObject.put("name", "최재형");
	
	jArray.add(1, jObject);
	//전체 JSONObject를저장할 메인JSONObjec객체를 설정하여 저장(키,벨류)
	jsonMain.put("List", jArray);
	
	out.println(jsonMain.toJSONString());
	
%>