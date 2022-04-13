<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>게시판 웹 사이트</title>
</head>
<body>
	<%		
		int board_id=0;
		if(request.getParameter("board_id") != null){
			board_id = Integer.parseInt(request.getParameter("board_id"));
		}
		
		if(board_id == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'Board.jsp'");
			script.println("</script>");	
		}
		
		BoardDAO boardDAO = new BoardDAO();
		Board board = new Board();
		board = boardDAO.getBoard(board_id);
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<a class="navbar-brand" href="Board.jsp">JSP 게시판 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="row">
		<form method="post" action="deleteAction.jsp?board_id=<%= board_id %>">
			<table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="backgroud-color:#eeeeee; text-align: center;">비밀번호를 입력하세요</th>
					</tr>
				</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="비밀번호" name="password" maxlength="45"></td>
						</tr>
					</tbody>		
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="글삭제">
		</form>	
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>