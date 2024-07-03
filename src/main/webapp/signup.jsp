<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- Created By CodingNepal -->
<html >
<%
	if(session.getAttribute("user_id")!=null) {
		response.sendRedirect("gallery.do");
	}
%>
   <head>
      <meta charset="utf-8">
      <title>Login Form Design | CodeLab</title>
      <link rel="stylesheet" href="./css/signup.css">
   </head>
   <body>
      <div class="wrapper">
         <a href="./index.jsp">
            <div class="title">
               PA+CH
            </div>
            </a>
         <br>
         <c:if test="${error=='-1'}">
         	알수없는 오류로 회원가입에 실패했습니다.
         </c:if>
          <c:if test="${id_error=='-1'}">
         	아이디가 중복돼있습니다.
         </c:if>
         <c:if test="${password_error=='-1' }">
            		비밀번호와 비밀번호확인칸이 서로 맞지않습니다.
            	</c:if>
         <form action="signup.do" method="POST">
            <div class="field">
               <input name ="nickname" type="text" required>
               <label>이름</label>
            </div>
            <div class="field">
                <input name = "user_id" type="text" required>
                <label>아이디</label>
             </div>
            <div class="field">
                <input name = "email" type="email" required>
                <label>이메일</label>
             </div>
            <div class="field">
            	
               <input name = "password"type="password" required>
               <label>비밀번호</label>
            </div>
            <div class="field">
                <input name = "password_check"type="password" required>
                <label>비밀번호 확인</label>
             </div>
            <br><br>
            <div class="field">
               <input type="submit" value="가입하기">
            </div>
         </form>
      </div>
   </body>
</html>