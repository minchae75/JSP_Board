<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.io.PrintWriter" %>
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
			if(board.getTitle() == null || board.getContent() == null || board.getWriter() == null || board.getPassword() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('모든 칸을 입력해주십시오.')");
				script.println("history.back()");
				script.println("</script>");	
			}
			else {
				//실제 Data 저장을 위해 저장 함수를 호출하는 부분
				BoardDAO boardrDao = new BoardDAO();
				int result = boardrDao.write(board.getTitle(), board.getContent(),board.getWriter(),board.getPassword()); 
				
				if(result >= 0){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'Board.jsp'");
					script.println("</script>");	
				} else if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 등록에 실패하였습니다.')");
					script.println("history.back()");
					script.println("</script>");	
				}
			}
		

	%>

</body>
</html>