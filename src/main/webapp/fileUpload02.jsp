<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-10-27
  Time: 오후 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>파일업로드</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js     "></script>
</head>
<body>
<form action="fileUpload02_process.jsp" method="post" enctype="multipart/form-data">
  <label for="user-name">이름 :</label>
  <input type="text" id="user-name" name="userName"><br>
  <label for="subject">제목</label>
  <input type="text" id="subject" name="subject"><br>
  <label type="file">파일 : </label>
  <input type="file" id="file" name="file"><br>
  <button type="submit">파일 업로드</button>
</form>

</body>
</html>
