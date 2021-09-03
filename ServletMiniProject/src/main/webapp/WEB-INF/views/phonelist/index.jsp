<%@page import="com.phone.vo.PhoneBookVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<PhoneBookVO> list = (List<PhoneBookVO>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 뷰포트 설정 -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 부트스트랩 css 사용 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<title>Phonelist Mini Project</title>
<style>

@media screen and (min-width: 768px) {
	.container {
		width: 750px;
		margin-top: 30px;
		margin-bottom: 30px;
	}
}

@media screen and (min-width: 992px) {
	.container {
		width: 970px;
		margin-top: 30px;
		margin-bottom: 30px;
	}
}

@media screen and (min-width: 1200px) {
	.container {
		width: 1170px;
		margin-top: 30px;
		margin-bottom: 30px;
	}
}

body > header {
	text-align: center;
	margin-top: 30px;
	margin-bottom: 30px;
}

main > header {
	text-align: center;
	margin-top: 10px;
	margin-bottom: 10px;
}

footer {
	text-align: center;
}

table {
	border-collapse: collapse;
}

</style>

</head>
<body>
	<header>
		<h2>주소록 Servlet</h2>
	</header>

	<main>
		<header>
			<h4>목록</h4>
		</header>
		<section class="container">
			<!-- 검색  -->
			<form action="<%=request.getContextPath()%>/" method=POST>
				<label>검색어</label> <input type="hidden" name="a" value="search" />
				<input type="text" name="keyword" id="keyword" /> <input type="submit" value="검색" />
			</form>
		</section>
		<section class="container">
			<!-- 리스트 -->
			<table class="table">
				<thead>
					<tr class="row">
						<th class="col text-center">이름</th>
						<th class="col text-center">휴대전화</th>
						<th class="col text-center">전화번호</th>
						<th class="col text-center">도구</th>
				</thead>
				<tbody>
					<%
					for (PhoneBookVO vo : list) {
					%>
					<tr class="row">
						<td class="col text-center"><%=vo.getName()%></td>
						<td class="col text-center"><%=vo.getHp()%></td>
						<td class="col text-center"><%=vo.getTel()%></td>
						<td class="col text-center">
							<form action="<%=request.getContextPath()%>/" method="POST">
								<input type="hidden" name="a" value="delete" /> 
								<input type="hidden" name="id" value="<%=vo.getId()%>" /> 
								<input type="submit" value="삭제" class="btn btn-dark btn-sm" />
							</form>
						</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</section>
		<section class="container">
			<button class="btn btn-primary" data-toggle="modal" data-target="#addDialog">새 주소 추가</button>
		</section>
		<jsp:include page="/WEB-INF/views/phonelist/form.jsp" />
	</main>
	<footer>
		<p>Copyright 2021 @kanglaeheon</p>
	</footer>

	<!--  부트스트랩 js 사용 -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
</body>
</html>