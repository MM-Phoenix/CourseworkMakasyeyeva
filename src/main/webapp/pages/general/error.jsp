<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="errorText" scope="request" type="java.lang.String"/>

<html>
<head>
    <link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/css/bundle.css'>
    <title>Error</title>
</head>
<body>
<div class="main">
    <div class="link-login-div" style="width: auto">
        <h1>
            Oops!
        </h1>
        <div class="feature-text__paragraphs">
            <p class="center-text" data-reveal-self="" data-has-intersected="true" data-scrolled-into-view="true" data-scrolled-past-view="false"><span class="desktop">${errorText}. Please logout or return to the allowed area.</span></p>
        </div>
        <div class="login-container">
            <div style="display: flex">
                    <a class="link link-is-button theme-dark-background" data-component-name="link" href="${pageContext.request.contextPath}/" aria-label="Go to main">
                        <span class="link-text" property="name">
                            Back to main
                        </span>
                    </a>
            </div>
        </div>

        <%if (request.getRemoteUser() != null) {%>
            <div class="login-container">
                <div>
                    <a class="small-link-center" href="${pageContext.request.contextPath}/logout">Logout</a>
                </div>
            </div>
        <%}%>
    </div>
</div>

<%--<div>${errorText}</div>--%>

<%--<a href="${pageContext.request.contextPath}/">Go to main</a>--%>
<%--<%if (request.getRemoteUser() != null) {%>--%>
<%--    <a href="${pageContext.request.contextPath}/logout">Logout</a>--%>
<%--<%}%>--%>
</body>
</html>
