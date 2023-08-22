<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//로그아웃 처리 1: session 영역의 속성명을 지정해서 삭제한다.
//session 속성값 중 특정 하나만 삭제 가능
session.removeAttribute("UserId");
session.removeAttribute("UserName");

/*
로그아웃 처리2 : session 영역 전체의 속성을 한꺼번에 삭제한다.
	만약 회원인증 이외에 데이터가 있다면 사용시 조심해야 한다.
*/
//session 영역에 있는 데이터를 전체 삭제함 완전 비워짐
session.invalidate();

//로그아웃 처리 후 로그인 페이지로 '이동'한다.
response.sendRedirect("LoginForm.jsp");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>