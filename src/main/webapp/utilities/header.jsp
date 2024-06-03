<%--<%@ page %>--%>

<header>
    <nav aria-label="Main" id="navigation-container" class="navigation-bar">
        <div class="navigation-desktop-container">
            <div class="navigation-desktop">
                <div class="navigation-desktop-logo-container">
                    <a class="navigation-desktop-logo" aria-label="Private Weather Forecast Home" href="${pageContext.request.contextPath}/">
                        <img src="${pageContext.request.contextPath}/images/pwf-logo-white.png"
                             height="50px" width="150px"
                             alt="PrivateWeatherForecast" style="color: black">
                    </a>
                </div>
                <div class="navigation-desktop-spacer">
                </div>
                <div class="navigation-desktop-account-container">
                    <div class="navigation-action-container">
                        <div class="navigation-to-main">
                            <a href="${pageContext.request.contextPath}/" class="navigation-to-main-link" style="color: black">Go to main</a>
                        </div>
                    </div>
                    <div class="navigation-action-container">
                        <div>
                            <div>
                                <a href="${pageContext.request.contextPath}/logout" class="navigation-logout">Logout</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</header>