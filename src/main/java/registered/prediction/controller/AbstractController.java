package registered.prediction.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import registered.date.data.PredictionDate;
import registered.date.service.PredictionDateService;
import registered.location.data.PredictionLocation;
import registered.location.service.PredictionLocationService;
import registered.prediction.service.PredictionService;

import java.util.Collection;

public abstract class AbstractController extends HttpServlet {

    protected PredictionService predictionService;
    protected PredictionDateService predictionDateService;
    protected PredictionLocationService predictionLocationService;

    @Override
    public void init() throws ServletException {
        super.init();
        predictionService = (PredictionService) getServletContext().getAttribute("predictionService");
        predictionDateService = (PredictionDateService) getServletContext().getAttribute("predictionDateService");
        predictionLocationService = (PredictionLocationService) getServletContext().getAttribute("predictionLocationService");
    }

    protected long getAndSetAttributeSelectedId(HttpServletRequest request, String parameterName) {
        String parameter = request.getParameter(parameterName);
        long id = parameter == null ? 0 : Long.parseLong(parameter);

        request.setAttribute(parameterName, id);
        return id;
    }

    protected void populatePredictionDates(HttpServletRequest request) {
        Collection<PredictionDate> allPredictionDates = predictionDateService.findAll();
        request.setAttribute("allPredictionDates", allPredictionDates);
    }

    protected void populatePredictionLocations(HttpServletRequest request) {
        Collection<PredictionLocation> predictionLocations = predictionLocationService.findAll();
        request.setAttribute("predictionLocations", predictionLocations);
    }
}
