<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 주소 추가</title>
</head>
<body>
	<h2>주소록 Servlet</h2>
	<h4>새 주소 등록</h4>
	<form action="<%= request.getContextPath() %>/?a=form"
		method="POST">
		<!-- hidden은 사용자 입력은 아니지만 전송해야 할 데이터 -->
		<input type="hidden" value="form" name="a" />
		<label for="name">이름</label>
		<input type="text" name="name" id="name" /><br />
		<label for="hp">휴대전화</label>
		<input type="text" name="hp" id="hp" /><br />
		<label for="tel">전화번호</label>
		<input type="text" name="tel" id="tel" /><br />
		
		<!-- 전송 버튼 -->
		<input type="submit" value="주소 등록" />
	</form>	

	<p>
		<a href="<%= request.getContextPath() %>/pl">목록 보기</a>
	</p>
</body>
</html>