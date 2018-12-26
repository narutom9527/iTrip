<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>文件上传</title>
</head>
<body>
	<form action="fileUpload" method="post" enctype="multipart/form-data" >
		<input type="file" name="file"/>
		<input type="submit" value="上传"/>
	</form>
</body>
</html>