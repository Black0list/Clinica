package com.clinica.repository;

import com.clinica.dao.UserDAO;
import com.clinica.model.User;
import com.clinica.repository.repositoryIntf.UserRepositoryIntf;
import com.clinica.utils.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

import java.util.Optional;

public class UserRepository implements UserRepositoryIntf {
    private static UserRepository instance;
    private static final UserDAO userDao = UserDAO.getInstance();;

    private UserRepository() {}

    public static synchronized UserRepository getInstance() {
        if (instance == null)
            instance = new UserRepository();
        return instance;
    }

    public Optional<User> findByEmail(String email) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            TypedQuery<User> query = em.createQuery(
                    "SELECT u FROM User u WHERE u.email = :email", User.class);
            query.setParameter("email", email);
            return Optional.of(query.getSingleResult());
        } catch (NoResultException e) {
            return Optional.empty();
        } finally {
            em.close();
        }
    }

    public void create(User user){
        userDao.create(user);
    }
}
