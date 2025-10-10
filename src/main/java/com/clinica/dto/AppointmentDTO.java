package com.clinica.dto;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;

public class AppointmentDTO implements Serializable {
    private Long id;
    private LocalDate date;
    private LocalTime time;
    private String status;
    private String doctorName;
    private String patientName;

    public AppointmentDTO() {}

    // Getters & Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public LocalDate getDate() { return date; }
    public void setDate(LocalDate date) { this.date = date; }

    public LocalTime getTime() { return time; }
    public void setTime(LocalTime time) { this.time = time; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getDoctorName() { return doctorName; }
    public void setDoctorName(String doctorName) { this.doctorName = doctorName; }

    public String getPatientName() { return patientName; }
    public void setPatientName(String patientName) { this.patientName = patientName; }
}
