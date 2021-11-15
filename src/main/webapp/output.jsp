<%@page import="kh.com.post.dto.PostDTO"%>
<%@page import="kh.com.post.dao.PostDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
PostDAO dao = PostDAO.getInstance();
ArrayList<PostDTO> list = dao.selectAll();
%>
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

<!-- 로딩 바 -->
<script src="https://cdn.jsdelivr.net/npm/pace-js@latest/pace.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pace-js@latest/pace-theme-default.min.css">
<link rel="stylesheet" href="./css/loading-bar.css">
</head>
<body>
	<table class="table">
		<tr>
			<th scope="col">No</th>
			<th scope="col">Nickname</th>
			<th scope="col">Message</th>
			<th scope="col">수정</th>
			<th scope="col">삭제</th>
		</tr>
		<%
		if (list != null) {
			for (PostDTO dto : list) {
		%>
		<tr>
			<td scope="row"><input type="text" value="<%=dto.getSeq()%>"
				disabled></td>
			<td><input type="text" class="nickname<%=dto.getSeq()%>"
				value="<%=dto.getNickname()%>"></td>
			<td><input type="text" class="post<%=dto.getSeq()%>"
				value="<%=dto.getPost()%>"></td>
			<td><button class="btn btn-dark btn_Modify"
					value="<%=dto.getSeq()%>">수정</button></td>
			<td><button class="btn btn-danger btn_Delete"
					value="<%=dto.getSeq()%>">삭제</button></td>
		</tr>
		<%
		}
		}
		%>

	</table>
	<div class="container">
		<div class="row">
			<button type="button" class="btn btn-secondary" id="btnBack">뒤로가기</button>
		</div>
	</div>
	<div>
		<p class="test"></p>
	</div>
	<script>
		$(function() {
			paceOptions = {
				// Disable the 'elements' source
				elements : false,

				// Only show the progress on regular and ajax-y page navigation,
				// not every request
				restartOnRequestAfter : false,
				className : 'my-custom-class'
			}
		})

		$('#btnBack').on('click', function() {
			location.href = "/";
		})
		$('.btn_Modify').on(
				'click',
				function(e) {
					let seq = $(e.target).val();
					let nickname = $('.nickname' + $(e.target).val()).val();
					let post = $('.post' + $(e.target).val()).val();

					$(location).attr(
							"href",
							"/ModifyAction.jsp?seq=" + seq + "&nickname="
									+ nickname + "&post=" + post);
				})
		$('.btn_Delete').on('click', function(e) {
			let seq = $(e.target).val();
			$(location).attr("href", "/DeleteAction.jsp?seq=" + seq);
		})
	</script>
</body>
</html>