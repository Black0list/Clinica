package com.clinica.dao;

import com.clinica.model.User;
import com.clinica.utils.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

import java.util.Optional;

public class UserDAO extends BaseDAO<User> {
    private static volatile UserDAO instance;

    private UserDAO() {
        super(User.class);
    }

    public static UserDAO getInstance() {
        if (instance == null) {
            synchronized (UserDAO.class) {
                if (instance == null) instance = new UserDAO();
            }
        }
        return instance;
    }
}
