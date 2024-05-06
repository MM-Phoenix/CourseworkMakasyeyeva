package registered.location.service;

import database.inmemory.repository.EntityRepository;
import registered.location.data.PredictionLocation;

import java.util.Collection;
import java.util.Optional;

public class PredictionLocationService {

    private final EntityRepository<PredictionLocation> predictionLocationRepository;

    public PredictionLocationService(EntityRepository<PredictionLocation> predictionLocationRepository) {
        this.predictionLocationRepository = predictionLocationRepository;
    }

    public Optional<PredictionLocation> findById(long id) {
        return predictionLocationRepository.findById(id);
    }

    public Collection<PredictionLocation> findAll() {
        return predictionLocationRepository.findAll();
    }
}
