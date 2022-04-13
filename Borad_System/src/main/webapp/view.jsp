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
		int board_id = 0;
		if(request.getParameter("board_id") != null) {
			board_id = Integer.parseInt(request.getParameter("board_id"));
		}
		if(board_id == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'Board.jsp'");
			script.println("</script>");	
		}
		Board board = new BoardDAO().getBoard(board_id);
		
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
			<table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="backgroud-color:#eeeeee; text-align: center;">게시판 글 보기</th>
					</tr>
				</thead>
					<tbody>
						<tr>
							<td style="width: 200px;">제목</td>
							<td colspan="2"><%= board.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td colspan="2"><%= board.getWriter() %></td>
						</tr>
						<tr>
							<td>작성일자</td>
							<td colspan="2"><%= board.getRegdate().substring(0,11) + board.getRegdate().substring(11,13) + ":" + board.getRegdate().substring(14,16)%></td>
						</tr>	
						<tr>
							<td>내용</td>
							<!-- 특수문자/공백 처리 정상적으로 보이도록 문자를 대체함 -->
							<td colspan="2" style="min-height: 200px text-align: left">
							<%= board.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>
						</td>
						</tr>						
					</tbody>		
			</table>
			<a href="Board.jsp" class="btn btn-primary">목록</a>
			<a href="update.jsp?board_id=<%=board_id%>" class="btn btn-primary">수정</a>
			<a href="delete.jsp?board_id=<%=board_id%>" class="btn btn-primary">삭제</a>
			<%-- <a onclick="return prompt('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?boardID=<%=board_id%>" class="btn btn-primary">삭제</a> --%>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>