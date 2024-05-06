package registered.prediction.service;

import database.inmemory.repository.EntityRepository;
import registered.prediction.data.Prediction;

import java.util.Collection;
import java.util.Optional;
import java.util.stream.Collectors;

public class PredictionService {

    private final EntityRepository<Prediction> predictionRepository;

    public PredictionService(EntityRepository<Prediction> predictionRepository) {
        this.predictionRepository = predictionRepository;
    }

    public Prediction create(Prediction prediction) {
        return predictionRepository.create(prediction);
    }

    public Optional<Prediction> findById(long id) {
        return predictionRepository.findById(id);
    }

    public Collection<Prediction> findAll() {
        return predictionRepository.findAll();
    }

    public Collection<Prediction> findAllByDateIdAndLocationId(long predictionDateId, long predictionLocationId) {
        return predictionRepository.findAll().stream()
                .filter(prediction ->
                        (predictionDateId == 0 || prediction.getDate().getId() == predictionDateId)
                                && (predictionLocationId == 0 || prediction.getLocation().getId() == predictionLocationId))
                .collect(Collectors.toList());
    }

    public Optional<Prediction> findByDateIdAndLocationId(long predictionDateId, long predictionLocationId) {
        return predictionRepository.findAll().stream()
                .filter(prediction -> prediction.getDate().getId() == predictionDateId &&
                        prediction.getLocation().getId() == predictionLocationId)
                .findFirst();
    }

    public Prediction update(Prediction prediction) {
        return predictionRepository.update(prediction);
    }
}

