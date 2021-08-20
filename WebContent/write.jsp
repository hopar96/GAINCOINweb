<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page  import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>GAINCOIN 게시판</title>
 	 <script type="text/javascript" src="js/ticker.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   
  </head>
  <body>
  	<%@ include file="nav.jsp"%>
</nav> 
<div class="container"> 
	<div class="row">
	<form method="post" action="writeAction.jsp">
		<table class="table table.striped" style="text-align: center; border: 1px solid #dddddd">
			<thread>
				<tr>
					<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기</th>
				</tr>
			</thread>
			<tbody>
				<tr>
					<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
				</tr>
				<tr>
					<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"></textarea></td>
				</tr>
			</tbody>
		</table>
		
		<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
		
	</form>
		
	</div>
 </div>
 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 <script src="js/bootstrap.js"></script>
  </body>
</html>