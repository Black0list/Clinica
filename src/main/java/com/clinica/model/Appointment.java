package com.clinica.model;

import com.clinica.model.enums.AppointmentStatus;
import com.clinica.model.enums.AppointmentType;
import jakarta.persistence.*;

import java.time.LocalDate;


@Entity
@Table(name = "appointments")
public class Appointment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDate startAt;
    private LocalDate endAt;
    private AppointmentStatus status;

    @ManyToOne
    @JoinColumn(name = "doctor_id")
    private Doctor doctor;

    @ManyToOne
    @JoinColumn(name = "patient_id")
    private Patient patient;

    private AppointmentType type;
    private String executor;

    public Appointment() {}

    public Appointment(Long id, LocalDate startAt, LocalDate endAt, AppointmentStatus status,
                       Doctor doctor, Patient patient, AppointmentType type, String executor) {
        this.id = id;
        this.startAt = startAt;
        this.endAt = endAt;
        this.status = status;
        this.doctor = doctor;
        this.patient = patient;
        this.type = type;
        this.executor = executor;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public LocalDate getStartAt() { return startAt; }
    public void setStartAt(LocalDate startAt) { this.startAt = startAt; }

    public LocalDate getEndAt() { return endAt; }
    public void setEndAt(LocalDate endAt) { this.endAt = endAt; }

    public AppointmentStatus getStatus() { return status; }
    public void setStatus(AppointmentStatus status) { this.status = status; }

    public Doctor getDoctor() { return doctor; }
    public void setDoctor(Doctor doctor) { this.doctor = doctor; }

    public Patient getPatient() { return patient; }
    public void setPatient(Patient patient) { this.patient = patient; }

    public AppointmentType getType() { return type; }
    public void setType(AppointmentType type) { this.type = type; }

    public String getExecutor() { return executor; }
    public void setExecutor(String executor) { this.executor = executor; }
}
