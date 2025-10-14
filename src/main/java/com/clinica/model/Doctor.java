package com.clinica.model;

import jakarta.persistence.*;

import java.util.List;


@Entity
@Table(name = "doctors")
@PrimaryKeyJoinColumn(name = "user_id")
public class Doctor extends User {

    private String registration;
    private String title;

    @ManyToOne
    @JoinColumn(name = "speciality_id")
    private Speciality speciality;

    @OneToMany(mappedBy = "doctor")
    private List<Availability> availabilities;

    @OneToMany(mappedBy = "doctor")
    private List<Appointment> appointments;

    public Doctor() {}

    public Doctor(String registration, String title, Speciality speciality, List<Availability> availabilities, List<Appointment> appointments) {
        this.registration = registration;
        this.title = title;
        this.speciality = speciality;
        this.availabilities = availabilities;
        this.appointments = appointments;
    }

    public String getRegistration() { return registration; }
    public void setRegistration(String registration) { this.registration = registration; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public Speciality getSpeciality() { return speciality; }
    public void setSpeciality(Speciality speciality) { this.speciality = speciality; }

    public List<Availability> getAvailabilities() { return availabilities; }
    public void setAvailabilities(List<Availability> availabilities) { this.availabilities = availabilities; }

    public List<Appointment> getAppointments() { return appointments; }
    public void setAppointments(List<Appointment> appointments) { this.appointments = appointments; }

}
