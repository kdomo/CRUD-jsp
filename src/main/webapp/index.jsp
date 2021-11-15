<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<style>
div{
margin:auto;
width:500px;
height:500px;
text-align:center;
padding-top:200px;
transform:translat
}
</style>
</head>
<body>
	<div>
		<button type="button" class="btn btn-dark" id="btnToPost">toPost</button>
		<button type="button" class="btn btn-dark" id="btnToOutput">toOutput</button>
	</div>
<script>
	$('#btnToPost').on('click',function(){
		location.href="/input.jsp";
	})
	$('#btnToOutput').on('click',function(){
		location.href="/output.jsp";
	})
	
</script>
</body>
</html>