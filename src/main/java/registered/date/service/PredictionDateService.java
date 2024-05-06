package registered.date.service;

import database.inmemory.repository.EntityRepository;
import registered.date.data.PredictionDate;

import java.time.LocalDate;
import java.util.Collection;
import java.util.Optional;

public class PredictionDateService {

    private final EntityRepository<PredictionDate> predictionDateRepository;

    public PredictionDateService(EntityRepository<PredictionDate> predictionDateRepository) {
        this.predictionDateRepository = predictionDateRepository;
    }

    public PredictionDate create(PredictionDate predictionDate) {
        return predictionDateRepository.create(predictionDate);
    }

    public Optional<PredictionDate> findById(long id) {
        return predictionDateRepository.findById(id);
    }

    public Collection<PredictionDate> findAll() {
        return predictionDateRepository.findAll();
    }

    public Optional<PredictionDate> findByDate(LocalDate date) {
        return predictionDateRepository.findAll().stream()
                .filter(predictionDate -> predictionDate.getDate().equals(date))
                .findFirst();
    }
}
