<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page  import="java.io.PrintWriter" %>
<%@ page  import="bbs.BbsDAO" %>
<%@ page  import="bbs.Bbs" %>
<%@ page  import="java.util.ArrayList" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>


<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>GAINCOIN 게시판</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   
  </head>

  <body>
  <%@ include file="nav.jsp" %>
<style>
.bbs_active{
  font-weight:bold;
  font-size:20px;
  text-decoration: underline;
}
</style>
  	<%
  		int pageNumber = 1;
  		if(request.getParameter("pageNumber") != null){
  			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
  		}
  	%>

<div class="container"> 
	<div class="row">
		<table class="table table.striped" style="text-align: center; border: 1px solid #dddddd">
			<thread>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">번호</th>
					<th style="background-color: #eeeeee; text-align: center;">제목</th>
					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center;">작성일</th>
				</tr>
			</thread>
			<tbody>
				<%
					BbsDAO bbsDAO = new BbsDAO();
					ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
					for(int i=0; i<list.size(); i++){
				%>
				<tr>
					<td><%= list.get(i).getBbsID() %></td>
					<td><a style ="text.css; font-weight:bold; color:#000000; text-decoration:none;"
					href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
					<td><%= list.get(i).getUserID() %></td>
					<td><%= list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13) + "시" + list.get(i).getBbsDate().substring(14,16) + "분" %></td>
				</tr>
				
				<% 
					}
				%>
			</tbody>
		</table>
		<%
			if(pageNumber != 1){
		%>
			<a href="bbs.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arraw-left">이전</a>
		<%
			} if(bbsDAO.nextPage(pageNumber + 1)){
		%>
			<a href="bbs.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arraw-left">다음</a>
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