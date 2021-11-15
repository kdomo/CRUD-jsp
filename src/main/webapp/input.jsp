<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<style>
.container {
	margin:auto;
width:500px;
height:500px;
}
.btn{
margin-top:10px
}
textarea {
	resize: none;
	width: 100%;
	height: 300px;
}
</style>
</head>
<body>
	<form method="post" action="inputAction.jsp" id="inputForm">
		<div class="container">

			<div class="row">
				<label>닉네임 : </label> <input type="text" name="nickname">
			</div>
			<div class="row">
				<label>메세지 : </label>
				<textarea name="post"></textarea>
			</div>
			<div class="row">
				<button type="button" class="btn btn-secondary" id="btnBack">뒤로가기</button>
				<button type="button" class="btn btn-dark" id="btnSubmit">전송</button>
			</div>
		</div>
	</form>
	<script>
		$('#btnBack').on('click', function() {
			location.href = "/";
		});
		$('#btnSubmit').on('click', function() {
				$('#inputForm').submit();
		});
	</script>
</body>
</html>