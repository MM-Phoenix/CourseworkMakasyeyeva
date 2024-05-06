package database.inmemory.repository;

import database.inmemory.data.Entity;

import java.util.Collection;
import java.util.Optional;
import java.util.TreeMap;

public abstract class AbstractEntityRepository<T extends Entity> implements EntityRepository<T> {

    private final TreeMap<Long, T> IN_MEMORY_DATA = new TreeMap<>();

    public AbstractEntityRepository() {
        init();
    }

    public abstract void init();

    @Override
    public T create(T t) {
        long newId = IN_MEMORY_DATA.isEmpty() ? 1 : IN_MEMORY_DATA.lastKey() + 1;
        t.setId(newId);
        IN_MEMORY_DATA.put(newId, t);
        return t;
    }

    @Override
    public Optional<T> findById(long id) {
        return Optional.ofNullable(IN_MEMORY_DATA.get(id));
    }

    @Override
    public Collection<T> findAll() {
        return IN_MEMORY_DATA.values();
    }

    @Override
    public T update(T t) {
        return IN_MEMORY_DATA.put(t.getId(), t);
    }

    @Override
    public void deleteById(Long id) {
        IN_MEMORY_DATA.remove(id);
    }
}
