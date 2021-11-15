<%@page import="kh.com.post.dto.PostDTO"%>
<%@page import="kh.com.post.dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String nickname = request.getParameter("nickname");
String post = request.getParameter("post");

PostDAO dao = PostDAO.getInstance();

int rs = dao.insert(new PostDTO(nickname, post));
if (rs == 1) {

	response.sendRedirect("/index.jsp");
} else {
	response.sendRedirect("/");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>