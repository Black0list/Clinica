package com.clinica.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.util.List;
import java.util.Optional;

public abstract class BaseDAO<T> {
    protected static final EntityManagerFactory emf =
            Persistence.createEntityManagerFactory("clinicaPU");

    protected final Class<T> entityClass;

    protected BaseDAO(Class<T> entityClass) {
        this.entityClass = entityClass;
    }

    //CREATE
    public void create(T entity) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(entity);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            System.out.println("Error creating entity: " + e.getMessage());
        } finally {
            em.close();
        }
    }

    //READ (findById)
    public Optional<T> findById(Object id) {
        EntityManager em = emf.createEntityManager();
        try {
            T entity = em.find(entityClass, id);
            return Optional.ofNullable(entity);
        } finally {
            em.close();
        }
    }

    //READ ALL
    public List<T> findAll() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("FROM " + entityClass.getSimpleName(), entityClass)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    //UPDATE
    public void update(T entity) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(entity);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            System.out.println("Error updating entity: " + e.getMessage());
        } finally {
            em.close();
        }
    }

    //DELETE
    public void delete(Object id) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            T entity = em.find(entityClass, id);
            if (entity != null) {
                em.remove(entity);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            System.out.println("Error deleting entity: " + e.getMessage());
        } finally {
            em.close();
        }
    }
}
