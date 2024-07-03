<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="patch.pic_memo_DTO" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!-- Coding By CodingNepal - youtube.com/codingnepal -->
<html>
  <head>
    <meta charset="utf-8">
    <title>Image Editor in JavaScript | CodingNepal</title>
    <link rel="stylesheet" href="css/see_more_pic.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
  </head>
   <header>
      <nav class="navbar">
        <a href="./index.jsp" class="logo">
          PA+CH
        </a>
        <ul class="menu-links">
          <li><a href="./upload.jsp">사진 업로드</a></li>
          <li><a href="./gallery.jsp">갤러리</a></li>
          <li><a href="./information.do">내 정보 수정</a></li>
          <li style="color: white"><%=session.getAttribute("nickname") %>님</li>
          <li class="join-btn"><a href="./logout.do">로그아웃</a></li>
        </ul>
      </nav>
    </header>
  <%
  pic_memo_DTO pic_DTO = (pic_memo_DTO)request.getAttribute("pic_DTO");	
  String user_id = (String)session.getAttribute("user_id");
  %>
  <body>
    <div class="container disable">
        <div class="content-wrapper">
            <div class="image-container">
              <img width="400" height="260"   src="gallery/<%=pic_DTO.getPic() %>" alt="Image description">
            </div>
            <div class="text-container">
              <h2 class="image-title" contenteditable="false"><%=pic_DTO.getTitle() %></h2>
              <p class="upload-date">업로드 날짜: <span id="uploadDate"><%=pic_DTO.getDate() %></span></p>
              <p class="image-memo" contenteditable="false" ><%=pic_DTO.getMemeo() %></p>
            </div>
          </div>
            <br>
            <div class="actions hidden">
            
            <c:if test="${pic_DTO.getUser_id()== user_id}">
              <button class="delete-btn" onclick="window.location.href = 'delete_pic.do?pic_id=<%=pic_DTO.getPic_memo_id()%>&user_id=<%=pic_DTO.getUser_id()%>'">삭제</button>
              <button class="edit-btn" onclick="window.location.href='update_pic.do?pic_id=<%=pic_DTO.getPic_memo_id()%>'">수정</button>
              </c:if>
              <a href="gallery/<%=pic_DTO.getPic() %>" download="<%=pic_DTO.getTitle()%>">다운로드</a>
            </div>
          </div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
      document.querySelectorAll('.grid-item').forEach(item => {
        const img = item.querySelector('img');
        img.addEventListener('click', function() {
          const actions = this.nextElementSibling;
          // Toggle visibility of the actions
          actions.style.display = actions.style.display === 'block' ? 'none' : 'block';
        });
      });
    
      // Handle delete
      document.querySelectorAll('.delete-btn').forEach(button => {
        button.addEventListener('click', function() {
          this.closest('.grid-item').remove();
        });
      });
    
      // Handle edit
      document.querySelectorAll('.edit-btn').forEach(button => {
        button.addEventListener('click', function() {
          const title = this.closest('.grid-item').querySelector('.image-title');
          const currentText = title.innerText;
          const newTitle = prompt('Enter new title', currentText);
          if (newTitle) title.innerText = newTitle;
        });
      });
    });
    document.querySelectorAll('.image-title, .image-memo').forEach(element => {
    element.addEventListener('blur', function() {
      console.log('New Content:', this.innerText);
    });
  });
    </script> 
  </body>
</html>