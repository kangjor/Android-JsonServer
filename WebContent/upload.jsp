<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page pageEncoding="UTF-8"%>

<%

String dir = "C:/spring_workspace/AndroidServer/upload";

int max = 5*1024*1024;
MultipartRequest mr = new MultipartRequest(request, dir, max, "UTF-8", new DefaultFileRenamePolicy());

String orgFileName = mr.getOriginalFileName("file1");

String saveFileName = mr.getFilesystemName("file1");

System.out.println(orgFileName+"이 저장되었습니다.");

%>