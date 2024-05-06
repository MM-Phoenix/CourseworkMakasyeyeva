package registered.date.data;

import database.inmemory.data.Entity;

import java.time.LocalDate;

public class PredictionDate implements Entity {

    private long id;
    private LocalDate date;

    public PredictionDate(LocalDate date) {
        this.date = date;
    }

    @Override
    public long getId() {
        return id;
    }

    @Override
    public void setId(long id) {
        this.id = id;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }
}
