<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>게시판 웹 사이트</title>
<style type="text/css">
	a,a:hover {
	color : #000000;
	text-decoration: none;}
</style>
</head>
<body>
	<%
		int pageNum = 1;
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
	
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
						<th style="backgroud-color:#eeeeee; text-align: center;"> 번호 </th>
						<th style="backgroud-color:#eeeeee; text-align: center;"> 제목 </th>
						<th style="backgroud-color:#eeeeee; text-align: center;"> 작성자 </th>
						<th style="backgroud-color:#eeeeee; text-align: center;"> 작성일 </th>
					</tr>
				</thead>
				<tbody>
					<%
						BoardDAO boardDAO = new BoardDAO();
						ArrayList<Board> List = boardDAO.getlist(pageNum);
						for(int i = 0;i<List.size();i++){
					%>	
					<tr>
						<td><%= List.get(i).getBoard_id() %></td>
						<td><a href="view.jsp?board_id=<%= List.get(i).getBoard_id() %>"><%= List.get(i).getTitle() %></a></td>
						<td><%= List.get(i).getWriter() %></td>
						<td><%= List.get(i).getRegdate().substring(0,11) + List.get(i).getRegdate().substring(11,13) + ":" + List.get(i).getRegdate().substring(14,16)%></td>
					</tr>	
					<%	
						}
					
					%>	
				</tbody>
			</table>
			<%
				//페이지 넘버 보여주는 부분
				if(pageNum != 1){
			%>
				<a href="Board.jsp?pageNum=<%=pageNum - 1%>" class="btn btn-success btn-arrow-left">이전</a>
			<%	
				} if (boardDAO.nextPage(pageNum + 1)) {
			%>
				<a href="Board.jsp?pageNum=<%=pageNum + 1%>" class="btn btn-success btn-arrow-right">다음</a>
			<%
				}
			%>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>