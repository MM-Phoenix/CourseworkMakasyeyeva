<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="errorText" scope="request" type="java.lang.String"/>

<html>
<head>
    <title>Error</title>
</head>
<body>

<div>${errorText}</div>

<a href="${pageContext.request.contextPath}/">Go to main</a>
<%if (request.getRemoteUser() != null) {%>
    <a href="${pageContext.request.contextPath}/logout">Logout</a>
<%}%>
</body>
</html>
