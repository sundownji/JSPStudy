<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForEachNormal</title>
</head>
<body>
	<!--
	forEach태그의 일반 for문 형태
	속성] 
		begin : 반복문의 시작값 
		end : 종료값
		step: 증가치(제외할 경우 1로 고정된다.)
		var : 반복에 사용할 변수 
	-->
	<h4>일반 for문 형태의 forEach 태그</h4>
	<!-- 총 3번 반복  -->
	<c:forEach begin="1" end="3" step="1" var="i">
		<p>반복 ${ i }입니다.</p>
	</c:forEach>
	
	<!--varStaus: 루프의 현재 상태를 알려주는 변수의 이름을 지정  -->
	<!--
	일반 for문에서의 varStatus 속성
		: 반복과 관련된 정보를 추상화한 클래스를 통해 정보를 반환한다.
		count : 실제 반복횟수를 반환한다. 1부터 시작
		index : 변수 i의 변화하는 값을 반환한다.
		first : 루프의 처음에 true를 반환한다.
		last : 마지막에 true를 반환한다.
		current : 현재 loop의 변수값을 반환한다. (var 속성에 지정된 변수)
		*즉 일반 for문에서는 index와 current는 동일한 값으로 출력된다.* 
	-->
	<h4>varStatus 속성 살펴보기</h4>
	<table border="1">
	<c:forEach begin="3" end="5" var="i" varStatus="loop">
		<tr>
			<td>count : ${ loop.count }</td>
			<td>index : ${ loop.index }</td>
			<td>current : ${ loop.current }</td>
			<td>first : ${ loop.first }</td>
			<td>last : ${ loop.last }</td>
		</tr>
	</c:forEach>
	</table>
	
	<h4>1에서 100까지 정수 중 홀수의 합</h4>
	<!-- step을 생략했으므로 1씩 증가한다.  -->
	<c:forEach begin="1" end="100" var="j">
		<!-- if(i%2 != 0)와 같은 조건  -->
		<c:if test="${ j mod 2 ne 0 }">
			<!-- sum에 증가하는 j를 누적해서 더해준다.-->
			<c:set var="sum" value="${ sum + j }" />
		</c:if>
	</c:forEach>
	1~100사이의 정수 중 홀수의 합은? ${ sum }
	
	
	<!--c:if문을 두개 작성하지 않았고 1번째 if문의 test 조건을 eq로 안쓰고 계속 더할라고함 왜지 -->
	<h4>JSTL의 forEach문과 if문을 활용해 아래 모양을 출력하시오</h4>
	<c:forEach begin="1" end="5" var="a">
		<c:forEach begin ="1" end="5" var="b">
			<c:if test="${ a eq b}" var ="sum1">
				1 &nbsp;
			</c:if>
			<c:if test="${not sum1 }">
				0 &nbsp;
			</c:if>
		</c:forEach>
		<br />
	</c:forEach>
	<!-- 
	연습문제] 아래 모양을 출력하시오. 단 JSTL의 forEach문과 if문을 
	활용하시오.
	1 0 0 0 0
	0 1 0 0 0
	0 0 1 0 0
	0 0 0 1 0
	0 0 0 0 1
-->
	
	
</body>
</html>