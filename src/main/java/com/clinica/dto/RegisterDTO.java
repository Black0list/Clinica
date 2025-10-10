package com.clinica.dto;

import com.clinica.model.enums.BloodType;
import java.io.Serializable;
import java.time.LocalDate;

public class RegisterDTO implements Serializable {
    private String name;
    private String email;
    private String password;
    private String cin;
    private LocalDate birthDate;
    private String sex;
    private String phone;
    private String address;
    private BloodType blood;

    public RegisterDTO() {}

    // Getters & Setters
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getCin() { return cin; }
    public void setCin(String cin) { this.cin = cin; }

    public LocalDate getBirthDate() { return birthDate; }
    public void setBirthDate(LocalDate birthDate) { this.birthDate = birthDate; }

    public String getSex() { return sex; }
    public void setSex(String sex) { this.sex = sex; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public BloodType getBlood() { return blood; }
    public void setBlood(BloodType blood) { this.blood = blood; }
}
