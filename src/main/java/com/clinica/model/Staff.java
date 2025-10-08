package com.clinica.model;


import jakarta.persistence.*;

@Entity
@Table(name = "staff")
@PrimaryKeyJoinColumn(name = "user_id")
public class Staff extends User{
    private String position;

    public Staff() {}

    public Staff(String position) {
        this.position = position;
    }

    public String getPosition() { return position; }
    public void setPosition(String position) { this.position = position; }
}
