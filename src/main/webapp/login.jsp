<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- Created By CodingNepal -->
<%
	if(session.getAttribute("user_id")!=null) {
		response.sendRedirect("gallery.do");
	}
%>
<c:if test="${login_success =='1' }"> 
	<script>
		location.href="gallery.do"
	</script>
</c:if>
<html>
   <head>
      <meta charset="utf-8">
      <title>Login Form Design | CodeLab</title>
      <link rel="stylesheet" href="./css/login.css">
   </head>
   <body>
      <div class="wrapper">
         <a href="./index.jsp">
         <div class="title">
            PA+CH
         </div>
      </a>
         <br>
         <form action="login.do" method="POST">
         	<c:if test="${error=='-1' }">
         		<p>아이디 또는 비밀번호가 틀립니다.</p>
         	</c:if>
         	<c:if test="${error=='-3' }">
         		<p>비정상적인 방법으로 접근하여 다시 로그인해주세요</p>
         	</c:if>
         	<c:if test="${success=='1' }">
         		<p>회원가입 성공하였습니다.</p>
         	</c:if>
            <div class="field">
               <input name = "id" type="text" required>
               <label>ID</label>
            </div>
            <div class="field">
               <input name = "password"type="password" required>
               <label>비밀번호</label>
            </div>
            <br><br>
            <div class="field">
               <input type="submit" value="로그인">
            </div>
            <div class="signup-link">
                가입하신 계정이 없으신가요? <a href="./signup.jsp">가입하기</a>
            </div>
         </form>
      </div>
   </body>
</html>