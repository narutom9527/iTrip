<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<!-- /upload对应我们刚刚配置的虚拟路径，upload前面一定要加“/” -->
	<img id="picture" src="/upload/${fileName}" title="图片" />${fileName}
</body>
</html>