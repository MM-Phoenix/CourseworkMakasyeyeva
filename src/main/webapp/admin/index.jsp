<%@ page import="java.time.Year" %>
<%@ page import="java.time.DayOfWeek" %>
<%@ page import="java.time.Month" %>
<%@ page import="registered.prediction.data.Prediction" %>
<%@ page import="java.util.Objects" %>
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
    <jsp:include page="../utilities/header.jsp"/>

    <div class="predictions-container" style="text-align: center">
        <div class="feature-text">
            <div class="feature-text-inner-wrapper">
                <div class="feature-text-header">
                    <h2 class="predictions-header">Private Weather Forecast</h2>
                </div>
                <div class="feature-text-paragraph">
                    <p class="predictions-paragraph">
                        "Select new "day", "month, "year", "location", type the new prediction to update Private Weather Forecast data.
                    </p>
                </div>
            </div>
        </div>

        <div class="predictions-inner-container">
            <div class="selection-container">
                <div class="selection">
                    <div class="small-header-container">
                        <h2 class="small-header">Update Data:</h2>
                    </div>
                    <form action="${pageContext.request.contextPath}/admin/add" method="POST">
                        <div class="table-container" style="display: inline-block">
                            <table class="selection-table">
                                <tbody>
                                <tr>
                                    <td>
                                        <label for="prediction-day">Day</label>
                                    </td>
                                    <td class="input-data">
                                        <input id="prediction-day" name="predictionDay" placeholder="Enter day" type="number" step="1"
                                               value="${predictionDay}" min="<%=DayOfWeek.MONDAY.getValue()%>" max="<%=DayOfWeek.SUNDAY.getValue()%>">
                                        <div>${predictionDayException}</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="prediction-month">Month</label>
                                    </td>
                                    <td class="input-data">
                                        <input id="prediction-month" name="predictionMonth" placeholder="Enter month" type="number" step="1"
                                               value="${predictionMonth}" min="<%=Month.JANUARY.getValue()%>" max="<%=Month.DECEMBER.getValue()%>">
                                        <div>${predictionMonthException}</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="prediction-year">Year</label>
                                    </td>
                                    <td class="input-data">
                                        <input id="prediction-year" name="predictionYear" placeholder="Enter year" type="number"
                                               value="${predictionYear}" min="<%=Year.MIN_VALUE%>" max="<%=Year.MAX_VALUE%>" step="1" maxlength="4">
                                        <div>${predictionYearException}</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="prediction-locations">Locations</label>
                                    </td>
                                    <td class="input-data">
                                        <select id="prediction-locations" name="predictionLocationId">
                                            <option value="${0}">Any</option>

                                            <c:forEach items="${predictionLocations}" var="predictionLocation">
                                                <option value="${predictionLocation.id}"
                                                        <c:if test="${predictionLocationId == predictionLocation.id}">selected</c:if>>
                                                        ${predictionLocation.name}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <% if (!Objects.equals(predictionLocationIdException, "")) {%>
                                    <tr>
                                        <td>Warning:</td>
                                        <td style="width: 100px; font-size: 10px; text-align: left;">${predictionLocationIdException}</td>
                                    </tr>
                                <%}%>
                                <tr>
                                    <td>
                                        <label for="prediction">Prediction</label>
                                    </td>
                                    <td class="input-data">
                                        <input id="prediction" name="predictionText" placeholder="Prediction text" type="text"
                                               value="${predictionText}">
                                        <div>${predictionIdException}</div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                            <% if (predictionId > 0) {%>
                                <div class="small-text-container">
                                    <p class="small-text">The prediction already exists. Do you want to update the existing prediction?</p>
                                </div>
                                <label>
                                    <input style="display: none" name="predictionId" value="${predictionId}">
                                </label>
                                <button class="link link-is-small-button theme-dark-background" type='submit'>Update</button>
                            <%} else {%>
                                <button class="link link-is-small-button theme-dark-background" type='submit'>Add</button>
                            <%}%>
                        </div>
                    </form>
                </div>
            </div>

            <%  Prediction prediction;
                if ((prediction = (Prediction) request.getAttribute("prediction")) != null) {%>

                <div class="small-header-container" style="margin-top: 80px">
                    <h2 class="small-header">Prediction <%=request.getAttribute("predictionSavedText")%>!</h2>
                </div>
                <div style="display: inline-block">
                    <table style="margin-bottom: 64px">
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
                </div>
            <%}%>
        </div>
    </div>
</body>
</html>
