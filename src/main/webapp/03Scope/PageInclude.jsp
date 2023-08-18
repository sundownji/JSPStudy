<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>Include 페이지</h4>
<%
//include 동일한 페이지라고 생각해서 데이터를 가져온다고 생각하면된다.
int pInteger2 = (Integer)(pageContext.getAttribute("pageInteger"));
//String pString2 = pageContext.getAttribute("pageString").toString();
Person pPerson2 = (Person)(pageContext.getAttribute("pagePerson"));
%>
<ul>
    <li>Integer 객체 : <%= pInteger2 %></li>
    <li>String 객체 : <%= pageContext.getAttribute("pageString") %></li>
    <li>Person 객체 : <%= pPerson2.getName() %>, <%= pPerson2.getAge() %></li>
</ul>

</body>
</html>