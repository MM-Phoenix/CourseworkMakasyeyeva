package registered.location.repository;

import database.inmemory.repository.AbstractEntityRepository;
import registered.location.data.PredictionLocation;

public class PredictionLocationInMemoryRepository extends AbstractEntityRepository<PredictionLocation> {

    @Override
    public void init() {
        create(new PredictionLocation("Kyiv"));
        create(new PredictionLocation("Luhansk"));
        create(new PredictionLocation("Sevastopol'"));
        create(new PredictionLocation("L'viv"));
    }
}
