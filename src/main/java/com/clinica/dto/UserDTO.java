package com.clinica.dto;

import java.io.Serializable;

public class UserDTO implements Serializable {
    private Long id;
    private String name;
    private String email;
    private String phone;
    private boolean isActive;
    private boolean isAdmin;
    private String type;

    public UserDTO() {}

    // Getters & Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public boolean isActive() { return isActive; }
    public void setActive(boolean active) { isActive = active; }

    public boolean isAdmin() { return isAdmin; }
    public void setAdmin(boolean admin) { isAdmin = admin; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
}
