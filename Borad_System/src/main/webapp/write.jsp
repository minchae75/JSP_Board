<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>게시판 웹 사이트</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<%-- <button type="button" class="navbar-toggle collapsed" 
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanede="false">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			</button> --%>
			<a class="navbar-brand" href="Board.jsp">JSP 게시판 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="row">
		<form method="post" action="writeAction.jsp">
			<table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="backgroud-color:#eeeeee; text-align: center;">글쓰기</th>
					</tr>
				</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="제목" name="title" maxlength="45"></input></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="내용" name="content" maxlength="2048" style="height: 350px;"></textarea></td>
						</tr>
						<tr>
							<td><input type="text" class="form-control" placeholder="작성자" name="writer" maxlength="45"></td>
						</tr>
						<tr>
							<td><input type="text" class="form-control" placeholder="비밀번호" name="password" maxlength="45"></td>
						</tr>
					</tbody>		
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="글등록">
		</form>	
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>