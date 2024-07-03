<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- Coding by CodingNepal || www.codingnepalweb.com -->
<html>
<c:if test="${delete_success=='1' }">
<script>
		window.onload=alert('성공적으로 탈퇴하였습니다.');
		location.href="index.do";
		</script>
</c:if>
<c:if test="${send_success=='1' }">
<script>
		window.onload=alert('성공적으로 전송하였습니다.');
		location.href="index.do";
		</script>
</c:if>
<c:if test="${send_error=='-1' }">
<script>
		window.onload=alert('알수없는 버그가일어났습니다.');
		location.href="index.do";
		</script>
</c:if>

<c:if test="${delete_error=='-1' }">
<script>
		window.onload=alert('성공적으로 탈퇴하였습니다.');
		location.href="index.do";
		</script>
</c:if>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Simple Responsive Website in HTML CSS</title>
    <link rel="stylesheet" href="./css/index.css" />
  </head>
  <body>
    <main>
      <!-- Header Start -->
      <header>
        <nav class="navbar">
          <a href="./index.do" class="logo">
            PA+CH
          </a>
          <ul class="menu-links">
            <li><a href="./signup.jsp">가입하기</a></li>
            <li class="join-btn"><a href="./login.jsp">로그인</a></li>
          </ul>
        </nav>
      </header>
      <!-- Header End -->
      <!-- Hero Start -->
      <section class="hero">
        <div class="row container">
          <div class="column">
            <h2>친구와 가족의 소중한 순간을 <br />공유하고 저장할 수 있는 웹사이트</h2>
            <p>사랑하는 사람의 소중한 순간을 공유하고 저장하세요. <br>이 웹사이트는 JSP 수업의 개인 프로젝트입니다. <br><br> 학번: 202188001<br> 반: 2C<br> 이름: 아밍척</p>
            <div class="buttons">
              <button class="btn">더 보기</button>
              <button class="btn" onclick="scrollToContact()">문의하기</button>
            </div>
          </div>
          <div class="column">
            <img src="./img/hiii.png" alt="heroImg" class="hero_img" />
          </div>
        </div>
        <img src="./img/bg-bottom-hero.png" alt="" class="curveImg" />
      </section>
      <section id="contact">
        <div class="contact-container">
          <div class="contact-column">
            <img src="./img/hi22.png" alt="Contact Image" class="contact-img" width="70%" height="70%"/>
          </div>
          <div class="contact-column">
            <h2>문의하기</h2>
            <form action="contact_admin.do" method="post">
              <input name = "id"type="text" placeholder="아이디" required>
              <input name = "email" type="email" placeholder="이메일" required>
              <textarea name = "message"placeholder="메시지..." required></textarea>
              <button type="submit" class="btn">메시지 보내기</button>
            </form>
          </div>
        </div>
      </section>
      <!-- Hero End-->
    </main>
    <script>
      const header = document.querySelector("header");
      const menuToggler = document.querySelectorAll("#menu_toggle");
      menuToggler.forEach(toggler => {
        toggler.addEventListener("click", () => header.classList.toggle("showMenu"));
      });

      document.querySelector('.btn:last-child').addEventListener('click', function(event) {
    event.preventDefault();
    document.getElementById('contact').scrollIntoView({ behavior: 'smooth' });
  });
    </script>
  </body>
</html>