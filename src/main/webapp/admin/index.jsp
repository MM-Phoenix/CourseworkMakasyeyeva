<%@ page import="java.time.Year" %>
<%@ page import="java.time.DayOfWeek" %>
<%@ page import="java.time.Month" %>
<%@ page import="registered.prediction.data.Prediction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="predictionLocations" scope="request"
             type="java.util.Collection<registered.location.data.PredictionLocation>"/>

<jsp:useBean id="predictionDay" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="predictionMonth" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="predictionYear" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="predictionLocationId" scope="request" type="java.lang.Long"/>
<jsp:useBean id="predictionId" scope="request" type="java.lang.Long"/>
<jsp:useBean id="predictionText" scope="request" type="java.lang.String"/>

<jsp:useBean id="predictionDayException" scope="request" type="java.lang.String"/>
<jsp:useBean id="predictionMonthException" scope="request" type="java.lang.String"/>
<jsp:useBean id="predictionYearException" scope="request" type="java.lang.String"/>
<jsp:useBean id="predictionLocationIdException" scope="request" type="java.lang.String"/>
<jsp:useBean id="predictionIdException" scope="request" type="java.lang.String"/>

<html>
<head>
    <title>Add prediction</title>
    <link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/css/bundle.css'>
</head>
<body>

<form action="${pageContext.request.contextPath}/admin/add" method="POST">
    <div>
        <label for="prediction-day">Day</label>
        <input id="prediction-day" name="predictionDay" placeholder="Enter day" type="number" step="1"
               value="${predictionDay}" min="<%=DayOfWeek.MONDAY.getValue()%>" max="<%=DayOfWeek.SUNDAY.getValue()%>">
        <div>${predictionDayException}</div>
    </div>
    <div>
        <label for="prediction-month">Month</label>
        <input id="prediction-month" name="predictionMonth" placeholder="Enter month" type="number" step="1"
               value="${predictionMonth}" min="<%=Month.JANUARY.getValue()%>" max="<%=Month.DECEMBER.getValue()%>">
        <div>${predictionMonthException}</div>
    </div>
    <div>
        <label for="prediction-year">Year</label>
        <input id="prediction-year" name="predictionYear" placeholder="Enter year" type="number"
               value="${predictionYear}" min="<%=Year.MIN_VALUE%>" max="<%=Year.MAX_VALUE%>" step="1" maxlength="4">
        <div>${predictionYearException}</div>
    </div>

    <div>
        <label for="prediction-locations">Locations</label>

        <select id="prediction-locations" name="predictionLocationId">
            <option value="${0}">Any</option>

            <c:forEach items="${predictionLocations}" var="predictionLocation">
                <option value="${predictionLocation.id}"
                        <c:if test="${predictionLocationId == predictionLocation.id}">selected</c:if>>
                        ${predictionLocation.name}
                </option>
            </c:forEach>
        </select>
        <div>${predictionLocationIdException}</div>
    </div>

    <div>
        <label for="prediction">Prediction</label>
        <input id="prediction" name="predictionText" placeholder="Enter prediction text" type="text"
               value="${predictionText}">
        <div>${predictionIdException}</div>
    </div>

    <%if (predictionId > 0) {%>
    <div>Do you want to update the existing prediction?</div>
    <label>
        <input style="display: none" name="predictionId" value="${predictionId}">
    </label>
    <%}%>

    <button type='submit'>Add</button>

    <%
        Prediction prediction;
        if ((prediction = (Prediction) request.getAttribute("prediction")) != null) {%>
    <h1>Prediction <%=request.getAttribute("predictionSavedText")%></h1>
    <table>
        <thead>
        <tr>
            <th>Text</th>
            <th>Date</th>
            <th>Location</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><%=prediction.getText()%></td>
            <td><%=prediction.getDate().getDate()%></td>
            <td><%=prediction.getLocation().getName()%></td>
        </tr>
        </tbody>
    </table>
    <%}%>
</form>

<a href="${pageContext.request.contextPath}/">Go to main</a>
<a href="${pageContext.request.contextPath}/logout">Logout</a>
</body>
</html>
