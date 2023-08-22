<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//로그인 폼에서 전송한 폼값을 받는다. 요청을 받은 페이지
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");
//출력결과가 Console에 나온다.
System.out.println();//콘솔에서 확인
//출력결과가 웹브라우저에 나온다.
out.println(); // 웹브라우저에 출력

/* web.xml에 입력한 컨텍스트 초기화 파라미터를 읽어온다.
해당정보는 application 내장객체를 사용해서 읽어올 수 있다.*/
String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleId");
String oraclePwd = application.getInitParameter("OraclePwd");

//위 정보를 통해 DAO 객체를 생성하고 오라클에 연결한다.
MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
/*폼값으로 받은 아이디, 패스워드를 인수로 전달하여 로그인 처리를 위한 회원인증을 진행한다.
일치하는 레코드가 있다면 DTO에 저장하여 반환한다.*/
MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
//자원해제
dao.close();

//회원정보가 있는 경우 if문 실행
if(memberDTO.getId() != null){
	//로그인에 성공한 경우 
	//session영역에 회원아이디와 이름을 저장한다.
	session.setAttribute("UserId", memberDTO.getId());
	session.setAttribute("UserName", memberDTO.getName());
	//그리고 로그인 페이지로 '이동'한다.
	//이동을 해도 페이지 세션이 유지되기 때문에 forward를 사용하지 않아도 됨
	//세션 - 한번 정보를 입력하면 브라우저를 종료할 때까지 가지고 있다는 특징 때문에
	//이동 가능한.
	response.sendRedirect("LoginForm.jsp");
}
else{
	//로그인에 실패한 경우
	//request 영역에 에러메세지를 저장한다.
	request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
	//그리고 로그인 페이지로 '포워드' forward한다. -> 왜냐면 정보가 없기 때문에~? 
	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
}
%>
