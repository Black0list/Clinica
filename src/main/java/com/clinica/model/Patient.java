package com.clinica.model;

import com.clinica.model.enums.BloodType;
import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
@Table(name = "patients")
@PrimaryKeyJoinColumn(name = "user_id")
public class Patient extends User{
    private String cin;
    private LocalDate birthDate;
    private String sex;
    private String phone;
    private String address;
    @Enumerated(EnumType.STRING)
    private BloodType blood;

    public Patient() {}

    public Patient(String cin, LocalDate birthDate, String sex, String phone, String address, BloodType blood) {
        this.cin = cin;
        this.birthDate = birthDate;
        this.sex = sex;
        this.phone = phone;
        this.address = address;
        this.blood = blood;
    }

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
