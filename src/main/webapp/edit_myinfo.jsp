<%@page import="patch.users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- Created By CodingNepal -->
<html>
   <head>
      <meta charset="utf-8">
      <title>Login Form Design | CodeLab</title>
      <link rel="stylesheet" href="./css/edit_myinfo.css">
   </head>
   <body>
   <%
   	users user = new users();
   	user = (users)session.getAttribute("user");
	if (session.getAttribute("user_id")==null) {
		response.sendRedirect("index.do");
	}
   %>
      <div class="wrapper">
         <a href="./index.jsp">
            <div class="title">
               PA+CH
            </div>
            </a>
         <form action="update_user.do" method="POST">
            <div class="field">
                <label><%=user.getNickname() %>님의 정보를 수정하시겠습니까?</label>
             </div>
             <c:if test="${success == '1'}">
             	성공적으로 변경이되었습니다.
             </c:if>
             <c:if test="${password_error == '-1'}">
             	비밀번호칸과 비밀번호확인칸이 서로 안맞습니다.
             </c:if>
             <c:if test="${error == '-1'}">
             	오류로 변경이 불가능합니다.
             </c:if>
             <c:if test="${error == '-2'}">
             	오류로 삭제가 불가능합니다.
             </c:if>
            <div class="field">
               <input name = "nickname" type="text" value = '<%=user.getNickname() %>' required>
               <label>이름</label>
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
               <input type="submit" value="수정하기">
            </div>
            
         </form>
         <div class="field">
               <form action="delete_user.do" method="post" onsubmit="return confirm('정말로 탈퇴하시겠습니까?')">
            		<input type = "hidden" value = "<%=session.getAttribute("user_id")%>" name = "id"> 
               		<button id = "unsubscribeButton" type="submit" value="">탈퇴하기</button>
               </form>
            </div>
         
      </div>
   </body>
</html>