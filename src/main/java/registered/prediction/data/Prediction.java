package registered.prediction.data;

import registered.date.data.PredictionDate;
import database.inmemory.data.Entity;
import registered.location.data.PredictionLocation;

public class Prediction implements Entity {

    private long id;
    private String text;
    private PredictionDate date;
    private PredictionLocation location;

    public Prediction(String text, PredictionDate date, PredictionLocation location) {
        this.text = text;
        this.date = date;
        this.location = location;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public PredictionDate getDate() {
        return date;
    }

    public void setDate(PredictionDate date) {
        this.date = date;
    }

    public PredictionLocation getLocation() {
        return location;
    }

    public void setLocation(PredictionLocation location) {
        this.location = location;
    }
}
