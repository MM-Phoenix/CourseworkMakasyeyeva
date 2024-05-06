<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="predictions" scope="request" type="java.util.Collection<registered.prediction.data.Prediction>"/>

<jsp:useBean id="allPredictionDates" scope="request" type="java.util.Collection<registered.date.data.PredictionDate>"/>
<jsp:useBean id="predictionLocations" scope="request" type="java.util.Collection<registered.location.data.PredictionLocation>"/>

<jsp:useBean id="predictionDateId" scope="request" type="java.lang.Long"/>
<jsp:useBean id="predictionLocationId" scope="request" type="java.lang.Long"/>

<html>
<head>
    <title>Show predictions</title>

    <link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/css/bundle.css'>
</head>
<body>

<form>
    <label for="prediction-dates">Dates</label>

    <select id="prediction-dates" name="predictionDateId">
        <option value="${0}">Any</option>

        <c:forEach items="${allPredictionDates}" var="predictionDate">
            <option value="${predictionDate.id}" <c:if test="${predictionDateId == predictionDate.id}">selected</c:if>>
                    ${predictionDate.date}
            </option>
        </c:forEach>
    </select>

    <label for="prediction-locations">Locations</label>

    <select id="prediction-locations" name="predictionLocationId">
        <option value="${0}">Any</option>

        <c:forEach items="${predictionLocations}" var="predictionLocation">
            <option value="${predictionLocation.id}" <c:if test="${predictionLocationId == predictionLocation.id}">selected</c:if>>
                    ${predictionLocation.name}
            </option>
        </c:forEach>
    </select>


    <button type='submit'>Show</button>

    <h1>Predictions</h1>
    <table>
        <thead>
        <tr>
            <th>Text</th>
            <th>Date</th>
            <th>Location</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${predictions}" var="prediction">
            <tr>
                <td>${prediction.text}</td>
                <td>${prediction.date.date}</td>
                <td>${prediction.location.name}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</form>

<a href="${pageContext.request.contextPath}/">Go to main</a>
    <a href="${pageContext.request.contextPath}/logout">Logout</a>
</body>
</html>
