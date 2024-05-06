package registered.date.repository;

import database.inmemory.repository.AbstractEntityRepository;
import registered.date.data.PredictionDate;

import java.time.LocalDate;

public class PredictionDateInMemoryRepository extends AbstractEntityRepository<PredictionDate> {

    @Override
    public void init() {
        create(new PredictionDate(LocalDate.of(2025, 1, 1)));
        create(new PredictionDate(LocalDate.of(2025, 1, 2)));
        create(new PredictionDate(LocalDate.of(2025, 1, 3)));
    }
}
