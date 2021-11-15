<%@page import="kh.com.post.dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
int seq = Integer.parseInt(request.getParameter("seq"));

PostDAO dao = PostDAO.getInstance();

int rs = dao.deleteBySeq(seq);
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