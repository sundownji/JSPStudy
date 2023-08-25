<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 수정페이지로 진입시 로그인을 확인한다. -->
<%@ include file="./IsLoggedIn.jsp"%>  
<%
//로그인이 되었다면 수정할 게시물의 일련번호를 파라미터로 받아오기
String num = request.getParameter("num");
//수정할 게시물을 얻어와서 DAO객체 생성 및 DB연결
BoardDAO dao = new BoardDAO(application);
//기존 게시물의 내용을 읽어온다. <상세보기에서 생성한 selectview를 가져와>
BoardDTO dto = dao.selectView(num);
//세션영역에 저장된 회원 아이디를 가져와서 문자열로 변환한다.
String sessionId = session.getAttribute("UserId").toString();
//로그인한 회원이 해당 게시물의 작성자인지 확인한다.
if (!sessionId.equals(dto.getId())){
	//작성자가 아닐 경우 자바스크립트의 alert 띄우고 history를 통해 back하고 return걸어줌
	//작성자가 아니라면 진입할 수 없도록 하고 뒤로 이동한다.
	JSFunction.alertBack("작성자 본인만 수정할 숫 있습니다.", out);
	return;
}
/*url의 패턴을 파악하면 내가 작성한 게시물이 아니어도 얼마든지 수정페이지로 진입할 수 있다. 
따라서 수정페이지 자체에서도 작성자 본인이 맞는지 확인하는 절차가 필요하다.*/
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script type="text/javascript">
/* 글쓰기 페이지에서 제목과 내용이 입력되었는지 검증하는 JS코드  */
	function validateForm(form) {  // 폼 내용 검증
	    if (form.title.value == "") {
	        alert("제목을 입력하세요.");
	        form.title.focus();
	        return false;
	    }
	    if (form.content.value == "") {
	        alert("내용을 입력하세요.");
	        form.content.focus();
	        return false;
	    }
	}
</script>
</head>
<body>
<jsp:include page="../Common/Link.jsp" />
	<h2>회원제 게시판 - 수정하기(Edit)</h2>
	<!-- 글쓰기 폼은 반드시 post방식으로 제작해야한다. get방식은 파일을
	첨부할 수 없고, 전송량도 4kb로 제한된다. 하지만 post는 전송량의
	제한이 없고 이미지,음원 등의 파일도 전송할 수 있기 때문이다. -->
	
	<!-- 수정페이지는 일반적으로 쓰기 페이지를 복사해서 제작하기 때문에
		action 속성값을 반드시 수정해야한다. 
		만약 수정하지 않으면 게시물이 추가되는 헤프닝이 생기게된다.  -->
		<form name="writeFrm" method="post" action="EditProcess.jsp"
	      onsubmit="return validateForm(this);">
	      
	    <!--게시물의 일련번호를 서버로 전송하기 위해 hidden 타입의 <input>
	    태그가 반드시 필요하다. 이 부분이 추가되지 않으면 게시물은 수정되지 않는다.  -->
	    <input type="hid-den" name="num" value="<%=dto.getNum() %>" />
	    
	    <table border="1" width="90%">
	    <!--session 영역에 로그인 정보가 남아있기 때문에 이름이 필요 없음  -->
	        <tr>
	            <td>제목</td>
	            <td>
	            	<!--<input> 태그인 경우 기존의 내용을 value 속성에 추가하면 된다.(checkbox, radio 등등도 value)  -->
	                <input type="text" name="title" style="width: 90%;" value="<%=dto.getTitle() %>" />
	            </td>
	        </tr>
	        <tr>
	            <td>내용</td>
	            <td>
	            	<!--value 속성이 내부적으로 없기 때문에 코드 정렬이 아니라 필요없는 공백삭제-->
	                <textarea name="content" style="width: 90%; height: 100px;"><%=dto.getContent() %></textarea>
	            </td>
	        </tr>
	        <tr>
	            <td colspan="2" align="center">
	                <button type="submit">작성 완료</button>
	                <button type="reset">다시 입력</button>
	                <button type="button" onclick="location.href='List.jsp';">
	                    목록 보기</button>
	            </td>
	        </tr>
	    </table>
	</form>
</body>
</html>