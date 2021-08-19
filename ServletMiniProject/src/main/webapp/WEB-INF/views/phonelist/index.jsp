<%@page import="com.phone.vo.PhoneBookVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<PhoneBookVO> list = (List<PhoneBookVO>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Phonelist Mini Project</title>
</head>
<body>
	<h2>주소록 Servlet</h2>
	<h4>목록</h4>
	<!-- 검색  -->
	<form action="<%= request.getContextPath() %>/" method=POST>
		<label>검색어</label>
		<input type="hidden" name="a" value="search" />
		<input type="text" name="keyword" id="keyword"/>
		<input type="submit" value="검색"/>
	</form>
	<!-- 리스트 -->
	<% for (PhoneBookVO vo: list) { %>
	<table border="1">
		<tr>
			<th>이름</th>
			<td><%= vo.getName() %></td>
		</tr>
		<tr>
			<th>휴대전화</th>
			<td><%= vo.getHp() %></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><%= vo.getTel() %></td>
		</tr>
		<tr>
			<th>도구</th>
			<td>
				<form action="<%= request.getContextPath() %>/" 
				method="POST">
					<input type="hidden" name="a" value="delete" />	
					<input type="hidden" name="id" value="<%= vo.getId() %>" />
					<input type="submit" value="삭제" />
				</form>
			</td>
		</tr>
	</table>
	<br />
	<% } %>
	
	<p>
		<a href="<%= request.getContextPath() %>/?a=form">새 주소 추가</a>
	</p>
	
</body>
</html>