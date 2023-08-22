<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OuterPage</title>
</head>
<body>
	<!--외부 파일 1과 동일한 내용  -->
	<h2>외부 파일 2</h2>
	<%
	//변수선언
	String newVar2 = "백제 온조왕";
	%>
	<!--2개의 영역의 속성값을 읽어서 출력한다.-->
	<ul>
		<li>page 영역 속성 : <%= pageContext.getAttribute("pAttr") %></li>
		<li>request 영역 속성 : <%= request.getAttribute("rAttr") %></li>
	</ul>
</body>
</html>