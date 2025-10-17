package com.clinica.dto;

import com.clinica.model.enums.AppointmentStatus;
import com.clinica.model.enums.AppointmentType;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;

public class AppointmentDTO implements Serializable {
    private Long id;
    private LocalDate date;
    private LocalTime startTime;
    private LocalTime endTime;
    private String status;
    private String type;
    private String executor;
    private String doctorName;
    private String patientName;

    public AppointmentDTO() {}

    // Getters & Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public LocalDate getDate() { return date; }
    public void setDate(LocalDate date) { this.date = date; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getDoctorName() { return doctorName; }
    public void setDoctorName(String doctorName) { this.doctorName = doctorName; }

    public String getPatientName() { return patientName; }
    public void setPatientName(String patientName) { this.patientName = patientName; }

    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }

    public LocalTime getEndTime() {
        return endTime;
    }
    public void setEndTime(LocalTime endTime) {
        this.endTime = endTime;
    }

    public LocalTime getStartTime() {
        return startTime;
    }
    public void setStartTime(LocalTime startTime) {
        this.startTime = startTime;
    }

    public String getExecutor() {
        return executor;
    }
    public void setExecutor(String executor) {
        this.executor = executor;
    }
}
