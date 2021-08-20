<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>GAINCOIN</title>
 <link rel="stylesheet" href="css/bootstrap.css">
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.0.0/css/bootstrap-slider.css" />

    
     <script type="text/javascript" src="js/ticker.js"></script>

  </head>
  <body>
 <%@ include file="nav.jsp" %>
  	
</nav>
 
   
    <div class="container">
    
    <table id="table_ticker" class="table table-hover text-center">
      <thead>
      <tr>
        <td>영문명</td>
        <td>한글명</td>
        <td>현재가</td>
        <td>전일대비</td>
        <td>거래대금 (단위 :백만)</td>
      </tr>
      </thead>
      <tbody>
      </tbody>
    </table>
   
    <div id='tmp2'>
    </div>
   </div>
 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 <script src="js/bootstrap.js"></script>
 <%@ include file="footer.jsp"%>
  </body>
</html>