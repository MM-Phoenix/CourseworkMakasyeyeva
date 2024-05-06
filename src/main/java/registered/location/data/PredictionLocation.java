package registered.location.data;

import database.inmemory.data.Entity;

public class PredictionLocation implements Entity {

    private long id;
    private String name;

    public PredictionLocation(String name) {
        this.name = name;
    }

    @Override
    public long getId() {
        return id;
    }

    @Override
    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
