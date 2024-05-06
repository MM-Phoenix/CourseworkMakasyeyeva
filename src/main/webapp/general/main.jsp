<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Main page</title>
</head>
<body>
<ul>
    <li><a href="${pageContext.request.contextPath}/user/show">Only for users and admins</a></li>
    <li><a href="${pageContext.request.contextPath}/admin/add">Only for admins</a></li>
</ul>

<%if (request.getRemoteUser() != null) {%>
    <a href="${pageContext.request.contextPath}/logout">Logout</a>
<%}%>
</body>
</html>
