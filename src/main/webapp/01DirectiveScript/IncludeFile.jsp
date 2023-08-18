<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- HTML 주석 (소스 보기 했을 때 화면에 출력된다.)
보통의 경우 include 되는 JSP 파일은 HTML 태그없이 순수한 JSP코드만 작성하는 것이 좋다.
포함되었을 때 HTML태그가 중복될 수 있기 때문이다.  -->

<%-- JSP 주석 (소스 보기 하더라도 출력되지 않는다.)
포함되는 페이지를 만들때에도 page 지시어는 반드시 있어야 한다.
page 지시어가 없는 JSP파일은 500에러가 발생된다.
--%>
<%
LocalDate today = LocalDate.now(); //오늘날짜
LocalDateTime tomorrow = LocalDateTime.now().plusDays(1); //내일 날짜
%>