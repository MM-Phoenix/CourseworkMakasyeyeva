package database.inmemory.repository;

import database.inmemory.data.Entity;

import java.util.Collection;
import java.util.Optional;

public interface EntityRepository<T extends Entity> {

    T create(T t);

    Optional<T> findById(long id);

    Collection<T> findAll();

    T update(T t);

    void deleteById(Long id);
}
