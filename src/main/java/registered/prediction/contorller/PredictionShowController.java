package registered.prediction.contorller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import registered.prediction.data.Prediction;

import java.io.IOException;
import java.util.Collection;

@WebServlet(name = "PredictionShowController", value = "/user/show")
public class PredictionShowController extends AbstractController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        populatePredictionDates(request);
        populatePredictionLocations(request);

        long predictionDateId = getAndSetAttributeSelectedId(request, "predictionDateId");
        long predictionLocationId = getAndSetAttributeSelectedId(request, "predictionLocationId");

        populatePredictions(request, predictionDateId, predictionLocationId);

        request.getRequestDispatcher("/user/index.jsp").forward(request, response);
    }

    private void populatePredictions(HttpServletRequest request, long predictionDateId, long predictionLocationId) {
        Collection<Prediction> predictions;

        if (predictionDateId == 0 && predictionLocationId == 0) {
            predictions = predictionService.findAll();
        } else {
            predictions = predictionService.findAllByDateIdAndLocationId(predictionDateId, predictionLocationId);
        }
        request.setAttribute("predictions", predictions);
    }
}
