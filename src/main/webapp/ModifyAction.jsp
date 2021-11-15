<%@page import="kh.com.post.dao.PostDAO"%>
<%@page import="kh.com.post.dto.PostDTO"%>
<%@page import="java.awt.Robot"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
int seq = Integer.parseInt(request.getParameter("seq"));
String nickname = request.getParameter("nickname");
String post = request.getParameter("post");

PostDAO dao = PostDAO.getInstance();
PostDTO dto = new PostDTO(seq,nickname,post);
int rs = dao.modify(dto);
if (rs == 1) {
	response.sendRedirect("/output.jsp");
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