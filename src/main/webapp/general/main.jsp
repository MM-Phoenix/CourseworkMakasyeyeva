<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/css/bundle.css'>
    <title>Main page</title>
</head>
<body>
    <div class="main">
        <div class="link-login-div">
            <h1>
                Private weather forecast
            </h1>
            <div class="feature-text__paragraphs">
                <p class="center-text" data-reveal-self="" data-has-intersected="true" data-scrolled-into-view="true" data-scrolled-past-view="false"><span class="desktop">Exclusive forecast service for verified members.</span></p>
            </div>
            <div class="link-container">
                <div>
                    <a class="link link-is-button theme-dark-background" data-component-name="link" data-component-id="20" href="${pageContext.request.contextPath}/user/show" property="item" typeof="WebPage" aria-label="Access like viewer" data-identifier="cta" data-section="hero">
                        <span class="link-text" property="name">
                            Access like viewer
                        </span>
                    </a>
                </div>
                <div>
                    <a class="link link-is-button theme-dark-background" data-component-name="link" data-component-id="20" href="${pageContext.request.contextPath}/admin/add" property="item" typeof="WebPage" aria-label="Access like admin" data-identifier="cta" data-section="hero">
                        <span class="link-text" property="name">
                            Access like admin
                        </span>
                    </a>
                </div>
            </div>

            <%if (request.getRemoteUser() != null) {%>
                <a class="small-link-center" href="${pageContext.request.contextPath}/logout">Logout</a>
            <%}%>
        </div>
    </div>
</body>
</html>
