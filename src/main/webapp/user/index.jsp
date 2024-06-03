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
    <jsp:include page="../utilities/header.jsp"/>

    <div class="predictions-container" style="text-align: center">
        <div class="feature-text">
            <div class="feature-text-inner-wrapper">
                <div class="feature-text-header">
                    <h2 class="predictions-header">Private Weather Forecast</h2>
                </div>
                <div class="feature-text-paragraph">
                    <p class="predictions-paragraph">
                        "Select desired "date" and "location", then "search" to filter the predictions.
                    </p>
                </div>
            </div>
        </div>

        <div class="predictions-inner-container">
            <div class="filter-container">
                <div class="filter">
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
                        <button  class="link link-is-small-button theme-dark-background" style="display: inline" type='submit'>Show</button>
                    </form>
                </div>
            </div>
            <div class="table-container" style="display: inline-block">
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
            </div>
        </div>
    </div>
</body>
</html>
