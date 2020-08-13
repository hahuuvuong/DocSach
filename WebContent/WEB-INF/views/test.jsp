<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="import.htm" method="post" enctype="multipart/form-data">

    <input type="file" name="file">

<input type="submit" value="Import" />
</form>
</body>
</html>