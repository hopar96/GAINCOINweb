<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GAINCOIN VIP COIN 검색</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<script type="text/javascript" src="js/icon_link.js"></script>
<style type="text/css">
td {
	width: 216px;
	height: 187px;
}
</style>

</head>
<body>

	<%@ include file="nav.jsp"%>

	<%
	if (userID == null) {

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('VIP권한이없습니다..')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");

	} else {
		UserDAO userDAO = new UserDAO();
		User list = userDAO.getUserDATA(userID);
		if (list.getVIP() != 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('VIP권한이없습니다..')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}

	}
	%>

	<div class="container">

		<table id="table_ticker" class="table table-hover text-center">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tbody>
			</tbody>
		</table>

		<div id='tmp2'></div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<%@ include file="footer.jsp"%>
</body>
</html>