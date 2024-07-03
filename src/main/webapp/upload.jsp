<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Created By CodingNepal -->
<html>
<%
		String user_id = (String)session.getAttribute("user_id");
		if(user_id ==null) {
			response.sendRedirect("index.jsp");
		}
	%>
   <head>
      <meta charset="utf-8">
      <title>Preview Image Before Upload | CodingNepal</title>
      <link rel="stylesheet" href="./css/upload.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
   </head>
   <body>
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
          <li class="join-btn"><a href="./index.jsp">로그아웃</a></li>
        </ul>
      </nav>
    </header>
    <form method="POST" enctype="multipart/form-data" action="upload.do">
      <div class="container">
         <div class="wrapper" onclick="defaultBtnActive()">
            <div class="image">
               <img src="" alt="">
            </div>
            <div class="content">
               <div class="icon">
                  <i class="fas fa-cloud-upload-alt"></i>
               </div>
               <div class="text">
                아직 선택한 파일이 없습니다!
               </div>
            </div>
            <div id="cancel-btn">
               <i class="fas fa-times"></i>
            </div>
            <div class="file-name">
               File name here
            </div>
         </div>
    
         <input name="image_file" id="default-btn" type="file" hidden>
         <div class="title-input-container">
          <input type="text" name = "title_input"id="title-input" placeholder="제목 입력" required="required">
          </div>
          <div class="title-input-container">
          <textarea name ="memo" id="title-input" placeholder="메모입력" required="required"></textarea>
          </div>
          <div class="buttons-row">
          
            <button id="upload-btn">업로드</button>
        </div>
          
      </div>
      </form>
      <script>
         const wrapper = document.querySelector(".wrapper");
         const fileName = document.querySelector(".file-name");
         const defaultBtn = document.querySelector("#default-btn");
         const customBtn = document.querySelector("#custom-btn");
         const cancelBtn = document.querySelector("#cancel-btn i");
         const img = document.querySelector("img");
         let regExp = /[0-9a-zA-Z\^\&\'\@\{\}\[\]\,\$\=\!\-\#\(\)\.\%\+\~\_ ]+$/;
         function defaultBtnActive(){
           defaultBtn.click();
         }
         defaultBtn.addEventListener("change", function(){
           const file = this.files[0];
           if(file){
             const reader = new FileReader();
             reader.onload = function(){
               const result = reader.result;
               img.src = result;
               wrapper.classList.add("active");
             }
             cancelBtn.addEventListener("click", function(){
               img.src = "";
               wrapper.classList.remove("active");
             })
             reader.readAsDataURL(file);
           }
           if(this.value){
             let valueStore = this.value.match(regExp);
             fileName.textContent = valueStore;
           }
         });
      </script>
   </body>
</html>