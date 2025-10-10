package com.clinica.repository.repositoryIntf;

import com.clinica.model.User;

import java.util.Optional;

public interface UserRepositoryIntf {
    void create(User user);
    Optional<User> findByEmail(String email);
}
