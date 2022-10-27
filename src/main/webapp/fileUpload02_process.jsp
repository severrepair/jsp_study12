<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-10-27
  Time: 오후 12:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="org.apache.commons.fileupload.DiskFileUpload" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.io.File" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>파일 업로드</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js     "></script>
</head>
<body>
<%
  String path = "C:\\java505\\upload";

    DiskFileUpload upload = new DiskFileUpload();

    upload.setFileSizeMax(1000000);
    upload.setSizeThreshold(4096);
    upload.setRepositoryPath(path);

    List items = upload.parseRequest(request);
    Iterator params = items.iterator();

    while (params.hasNext()){
        FileItem item = (FileItem) params.next();

//        사용자 입력을 받는 input 타입인지 파일인지 확인
        if (item.isFormField()){
//            input 태그일 경우 사용자 입력 정보 가져오기
            String name = item.getFieldName();
            String value = item.getString("utf-8");
            out.println(name + "=" + value + "<br>");
        }
        else {
//            파일일 경우 파일 정보 가져오기
            String fileFieldName = item.getFieldName();
//            파일명 가져오기
            String fileName = item.getName();
//            파일 타입 가져오기
            String contentType = item.getContentType();

            fileName = fileName.substring(fileName.lastIndexOf("\\")+1);//이름만 가져오기
//            파일 크기 가져오기
            long fileSize = item.getSize();

            File file = new File(path + "/" + fileName);
            item.write(file);

            out.println("-------------------------------<br>");
            out.println("요청 파라미터 이름:" + fileFieldName + "<br>");
            out.println("저장 파일 이름 : " + fileName + "<br>");
            out.println("파일 콘텐츠 유형:" + contentType + "<br>");
            out.println("파일 크기:" + fileSize);
        }
    }
%>

</body>
</html>
