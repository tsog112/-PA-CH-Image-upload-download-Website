<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="patch.pic_memo_DTO" %>

<!DOCTYPE html>
<!-- Coding By CodingNepal - www.codingnepalweb.com -->
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gallery</title>
  <link rel="stylesheet" href="./css/gallery.css">
</head>
<body>
	<c:if test="${update_success =='1' }">
		<script>
		window.onload=alert('성공적으로 수정하였습니다.');
		location.href="gallery.do";
		</script>
	</c:if>
	<c:if test="${update_pic =='1' }">
		<script>
		window.onload=alert('성공적으로 수정하였습니다.');
		location.href="gallery.do";
		</script>
	</c:if>
	<c:if test="${not_match =='-1' }">
		<script>
		window.onload=alert('비정상적인 접근입니다.');
		location.href="gallery.do";
		</script>
	</c:if>
	<c:if test="${delete_pic =='1' }">
		<script>
		window.onload=alert('정상적으로 삭제됐습니다.');
		location.href="gallery.do";
		</script>
	</c:if>
	<c:if test="${upload_success =='1' }">
		<script>
		window.onload=alert('성공적으로 등록하였습니다.');
		location.href="gallery.do";
		</script>
	</c:if>
	<%
		String user_id = (String)session.getAttribute("user_id");
		if(user_id ==null) {
			response.sendRedirect("index.do");
		}
	%>
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



    <h3>내 갤러리</h3>
    
    <!-- New Categories will be displayed here -->
    <div id="categories-container"></div>

    <form action="search_gallery.do" class="search-form">
      <input name = "search" type="text" placeholder="검색하세요!" required>
      <button class="material-symbols-outlined" type="submit"><img src="./img/search.png" height="50%" weight="50%"></button>
    </form><br>
    <div class="masonry">
      <%
      		ArrayList<pic_memo_DTO> pic_memo = new ArrayList<pic_memo_DTO>();
      		if(session.getAttribute("pic_memo")!=null){
      			 pic_memo = (ArrayList<pic_memo_DTO>)session.getAttribute("pic_memo");
      			 for(int i=0;i<pic_memo.size();i++) {
      					pic_memo_DTO pic_DTO = pic_memo.get(i);
      %>
      <div class="grid-item">
      <p style = "text-align: center;"class="image-title"><%=pic_DTO.getTitle() %></p>
        <img src='gallery/<%=pic_DTO.getPic() %>' alt="Image description">
        
        <div class="actions hidden">
          <a class="edit-btn" href="see_more_memo.do?pic_id=<%=pic_DTO.getPic_memo_id()%>">자세히 보기</a>
        </div>
      </div>
      <%} 
      }
      		if(pic_memo.isEmpty()){
      %>
      <a href = "upload.jsp">사진업로드하러가기</a>
      
      <%} %>
    </div>

</body>
</html>