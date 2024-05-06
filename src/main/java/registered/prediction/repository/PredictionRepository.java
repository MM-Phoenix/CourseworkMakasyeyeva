package registered.prediction.repository;

import database.inmemory.repository.AbstractEntityRepository;
import registered.prediction.data.Prediction;

import java.util.List;

public class PredictionRepository extends AbstractEntityRepository<Prediction> {

    private final List<Prediction> initPredictions;

    public PredictionRepository(List<Prediction> initPredictions) {
        this.initPredictions = initPredictions;
        init();
    }

    @Override
    public void init() {
        if (initPredictions != null) {
            initPredictions.forEach(this::create);
        }
    }
}
