<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>

<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="board" class="board.Board" scope="page"/>
<jsp:setProperty name="board" property="title"/>
<jsp:setProperty name="board" property="content"/>
<jsp:setProperty name="board" property="writer"/>
<jsp:setProperty name="board" property="password"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
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

			BoardDAO boardrDao = new BoardDAO();
			int result = boardrDao.delete(board_id,board.getPassword()); 
			
			if(result >= 0 && board.getPassword() != null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('성공적으로 삭제되었습니다.')");
				script.println("location.href = 'Board.jsp'");
				script.println("</script>");	
			} else if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 삭제에 실패하였습니다.')");
				script.println("history.back()");
				script.println("</script>");	
			}
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호를 입력하세요.')");
				script.println("history.back()");
				script.println("</script>");		
			}
	%>

</body>
</html>