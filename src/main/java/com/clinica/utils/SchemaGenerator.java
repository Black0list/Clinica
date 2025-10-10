package com.clinica.utils;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class SchemaGenerator {
    public static void main(String[] args) {
        System.out.println("⏳ Generating / updating database schema...");

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("clinicaPU");
        EntityManager em = emf.createEntityManager();

        em.getTransaction().begin();
        em.getTransaction().commit();

        em.close();
        emf.close();

        System.out.println("✅ Schema creation/update completed.");
    }
}
