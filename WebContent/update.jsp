<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page  import="java.io.PrintWriter" %>
<%@ page  import="bbs.Bbs" %>
<%@ page  import="bbs.BbsDAO" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>GAINCOIN 게시판</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet"
    	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
    	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
    	crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.0.0/css/bootstrap-slider.css" />
  </head>
  <body>
  	<%
  		String userID = null;
  		if(session.getAttribute("userID") != null){
  			userID = (String) session.getAttribute("userID");
  		}
  		if(userID == null){
  			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
  		}
  		int bbsID = 0;
  		if(request.getParameter("bbsID") != null){
  			bbsID = Integer.parseInt(request.getParameter("bbsID"));
  		}
  		if(bbsID == 0){
  			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
  		}
  		Bbs bbs = new BbsDAO().getBbs(bbsID);
  		if(!userID.equals(bbs.getUserID())) {
  			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
  		}
  	%>

  	<nav class="navbar navbar-default">
  		<div class="navbar-header">
   			<button type="button" class="navbar-toggle collapsed"
    			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
    			aria-expanded="false">
				<span class="icon-bar"></span>
   				<span class="icon-bar"></span>
   				<span class="icon-bar"></span>
  			</button>  
  			<a  class="navbar-brand" href="main.jsp">GAINCOIN</a>
 		</div>
 		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
 			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
						
					</ul>
				</li>
			</ul>
  		</div>
	<ul class="nav navbar-nav">
		<li><a href="introduce.jsp">코인 검색</a></li>
 		<li class="active"><a href="bbs.jsp">게시판</a></li>
		
	</ul>
</nav> 
<div class="container"> 
	<div class="row">
	<form method="post" action="updateAction.jsp?bbsID=<%= bbsID%>">
		<table class="table table.striped" style="text-align: center; border: 1px solid #dddddd">
			<thread>
				<tr>
					<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>
				</tr>
			</thread>
			<tbody>
				<tr>
					<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%=bbs.getBbsTitle() %>"></td>
				</tr>
				<tr>
					<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"><%= bbs.getBbsContent() %></textarea></td>
				</tr>
			</tbody>
		</table>
		
		<input type="submit" class="btn btn-primary pull-right" value="글수정">
		
	</form>
		
	</div>
 </div>
 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 <script src="js/bootstrap.js"></script>
  </body>
</html>