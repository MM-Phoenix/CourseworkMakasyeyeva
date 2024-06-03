package registered.prediction.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import registered.date.data.PredictionDate;
import registered.location.data.PredictionLocation;
import registered.prediction.data.Prediction;

import java.io.IOException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.Month;
import java.time.Year;
import java.util.Objects;

@WebServlet(name = "PredictionAddController", value = "/admin/add")
public class PredictionAddController extends AbstractController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        populateDefaultAttributeValues(request);
        populatePredictionLocations(request);
        request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
    }

    private void populateDefaultAttributeValues(HttpServletRequest request) {
        request.setAttribute("predictionDay", DayOfWeek.MONDAY.getValue());
        request.setAttribute("predictionMonth", Month.JANUARY.getValue());
        request.setAttribute("predictionYear", LocalDate.now().getYear());
        request.setAttribute("predictionLocationId", 0L);
        request.setAttribute("predictionId", 0L);
        request.setAttribute("predictionText", "");

        request.setAttribute("predictionDayException", "");
        request.setAttribute("predictionMonthException", "");
        request.setAttribute("predictionYearException", "");
        request.setAttribute("predictionLocationIdException", "");
        request.setAttribute("predictionIdException", "");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        populateDefaultAttributeValues(request);
        long predictionId = getAndSetAttributeSelectedId(request, "predictionId");
        String predictionText = getAndSetAttributePredictionText(request);

        Integer predictionDay = getDatePart(request, "predictionDay", DayOfWeek.MONDAY.getValue(), DayOfWeek.SUNDAY.getValue());
        Integer predictionMonth = getDatePart(request, "predictionMonth", Month.JANUARY.getValue(), Month.DECEMBER.getValue());
        Integer predictionYear = getDatePart(request, "predictionYear", Year.MIN_VALUE, Year.MAX_VALUE);

        long predictionLocationId = getAndSetAttributeSelectedId(request, "predictionLocationId");

        if (isValidPredictionDate(predictionDay, predictionMonth, predictionYear)) {
            LocalDate localDate = LocalDate.of(predictionYear, predictionMonth, predictionDay);

            predictionLocationService.findById(predictionLocationId).ifPresentOrElse(existedPredictionLocation ->
                    createOrUpdatePrediction(request, predictionText, localDate, existedPredictionLocation, predictionId),
                    () -> request.setAttribute("predictionLocationIdException", "Unexpected prediction location name."));
        }

        populatePredictionLocations(request);
        request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
    }

    private String getAndSetAttributePredictionText(HttpServletRequest request) {
        String predictionText = request.getParameter("predictionText");
        request.setAttribute("predictionText", predictionText);
        return predictionText;
    }

    private Integer getDatePart(HttpServletRequest request, String datePartParameter, int minValue, int maxValue) {
        String datePartExceptionParameter = datePartParameter + "Exception";

        try {
            int datePart = Integer.parseInt(request.getParameter(datePartParameter));

            if (datePart >= minValue && datePart <= maxValue) {
                request.setAttribute(datePartParameter, datePart);
                return datePart;
            } else {
                request.setAttribute(datePartExceptionParameter, "is not a number.");
            }
        } catch (Exception e) {
            request.setAttribute(datePartExceptionParameter, "is not a number.");
        }
        return null;
    }

    private boolean isValidPredictionDate(Integer predictionDay, Integer predictionMonth, Integer predictionYear) {
        return Objects.nonNull(predictionDay) && Objects.nonNull(predictionMonth) && Objects.nonNull(predictionYear);
    }

    private void createOrUpdatePrediction(HttpServletRequest request, String predictionText, LocalDate localDate,
                                          PredictionLocation predictionLocation, long predictionId) {
        predictionDateService.findByDate(localDate).ifPresentOrElse(existingPredictionDate -> {
            if (predictionId > 0) {
                updatePrediction(request, predictionId, predictionText, existingPredictionDate, predictionLocation);
            } else if (predictionId == 0) {
                predictionService.findByDateIdAndLocationId(existingPredictionDate.getId(), predictionLocation.getId())
                        .ifPresentOrElse(prediction -> request.setAttribute("predictionId", prediction.getId()),
                                () -> createPrediction(request, predictionText, existingPredictionDate, predictionLocation));
            } else {
                request.setAttribute("predictionIdException", "Prediction by id '" + predictionId + "' is absent.");
            }
        }, () -> {
            PredictionDate newPredictionDate = predictionDateService.create(new PredictionDate(localDate));
            createPrediction(request, predictionText, newPredictionDate, predictionLocation);
        });
    }

    private void updatePrediction(HttpServletRequest request, long predictionId, String predictionText,
                                  PredictionDate predictionDate, PredictionLocation predictionLocation) {
        predictionService.findById(predictionId).ifPresentOrElse(existedPrediction -> {
            existedPrediction.setText(predictionText);
            existedPrediction.setDate(predictionDate);
            existedPrediction.setLocation(predictionLocation);
            Prediction updatedPrediction = predictionService.update(existedPrediction);
            addPredictionAttribute(request, updatedPrediction, false);
        }, () -> request.setAttribute("predictionIException", "Prediction by id '" + predictionId + "' is absent."));
    }

    private void createPrediction(HttpServletRequest request, String text, PredictionDate date, PredictionLocation location) {
        Prediction prediction = new Prediction(text, date, location);
        Prediction newPrediction = predictionService.create(prediction);
        addPredictionAttribute(request, newPrediction, true);
    }

    private void addPredictionAttribute(HttpServletRequest request, Prediction prediction, boolean created) {
        request.setAttribute("predictionId", 0L);
        request.setAttribute("prediction", prediction);
        request.setAttribute("predictionSavedText", created ? "created" : "updated");
    }
}
