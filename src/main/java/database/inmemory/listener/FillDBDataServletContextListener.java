package database.inmemory.listener;

import registered.date.data.PredictionDate;
import registered.date.repository.PredictionDateInMemoryRepository;
import database.inmemory.repository.EntityRepository;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import registered.date.service.PredictionDateService;
import registered.location.data.PredictionLocation;
import registered.location.repository.PredictionLocationInMemoryRepository;
import registered.location.service.PredictionLocationService;
import registered.prediction.data.Prediction;
import registered.prediction.repository.PredictionRepository;
import registered.prediction.service.PredictionService;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Random;

public class FillDBDataServletContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        EntityRepository<PredictionDate> predictionDateEntityRepository = initAndGetPredictionDate(sce);
        EntityRepository<PredictionLocation> predictionLocationEntityRepository = initAndGetPredictionLocation(sce);

        iniPrediction(predictionDateEntityRepository, predictionLocationEntityRepository, sce);
    }

    private EntityRepository<PredictionDate> initAndGetPredictionDate(ServletContextEvent sce) {
        EntityRepository<PredictionDate> predictionDateRepository = new PredictionDateInMemoryRepository();
        sce.getServletContext().setAttribute("predictionDateService", new PredictionDateService(predictionDateRepository));

        return predictionDateRepository;
    }

    private EntityRepository<PredictionLocation> initAndGetPredictionLocation(ServletContextEvent sce) {
        EntityRepository<PredictionLocation> predictionLocationRepository = new PredictionLocationInMemoryRepository();
        sce.getServletContext().setAttribute("predictionLocationService", new PredictionLocationService(predictionLocationRepository));
        return predictionLocationRepository;
    }

    private void iniPrediction(EntityRepository<PredictionDate> predictionDateRepository,
                               EntityRepository<PredictionLocation> predictionLocationRepository, ServletContextEvent sce) {
        List<Prediction> predictions = createAndGetPredictions(predictionDateRepository, predictionLocationRepository);
        EntityRepository<Prediction> predictionRepository = new PredictionRepository(predictions);

        sce.getServletContext().setAttribute("predictionService", new PredictionService(predictionRepository));
    }

    private List<Prediction> createAndGetPredictions(EntityRepository<PredictionDate> predictionDateRepository,
                                                     EntityRepository<PredictionLocation> predictionLocationRepository) {
        Random randomPrediction = new Random();
        List<Prediction> predictions = new ArrayList<>();
        List<String> randomPredictions = List.of("Sunny", "Windy", "Cloudy", "Rainy");

        Collection<PredictionDate> predictionDates = predictionDateRepository.findAll();
        Collection<PredictionLocation> predictionLocations = predictionLocationRepository.findAll();

        for (PredictionDate predictionDate : predictionDates) {
            for (PredictionLocation predictionLocation : predictionLocations) {
                int randomPredictionIdx = randomPrediction.nextInt(randomPredictions.size());
                predictions.add(new Prediction(randomPredictions.get(randomPredictionIdx), predictionDate, predictionLocation));
            }
        }

        return predictions;
    }
}
