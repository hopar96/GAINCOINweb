<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Amatic+SC:wght@700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.css">
<%
String userID = null;
if (session.getAttribute("userID") != null) {
	userID = (String) session.getAttribute("userID");
}
%>

<body>

<div>
	<a href="main.jsp"><img style="width: 220px; height: 132px; vertical-align: center; margin-left: 43%;" src="img/logo.png"></a>
	</div>
	<nav class="navbar navbar-default" ; style="background-color: #DEE2FF;">
	<hr style="margin: 1px 0px 1px 0px; border-width: 4px;">
		<div class="navbar-header">
			<a class="navbar-brand" href="main.jsp"
				style="font-family: 'Amatic SC', cursive; font-style: bold; font-size: 30px;">&nbsp;&nbsp;&nbsp;GAINCOIN</a>
			<ul class="nav navbar-nav">
				<li class="active bbs_active"><a href="bbs.jsp">게시판</a></li>
				<li class="vip"><a href="coin_search.jsp">VIP 코인검색</a></li>

			</ul>
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>


		</div>
		<%
		if (userID == null) {
		%>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login2.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
		</div>
		<%
		} else {
		%>
		<%
						UserDAO userDAO = new UserDAO();
						User list = userDAO.getUserDATA(userID);
					%>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
						<li><a href="#"><%=list.getPoint() %>
 						<% if ( list.getVIP()==0){
							%>Member
						<%}else{
							%>VIP<%} %></a></li>
						
					</ul></li>
			</ul>
		</div>

		<%
		}
		%>
		<hr style="margin: 1px 0px 1px 0px; border-width: 4px;">
	</nav>
	<% %>
</body>
