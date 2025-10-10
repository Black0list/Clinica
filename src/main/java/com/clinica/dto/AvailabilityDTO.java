package com.clinica.dto;

import com.clinica.model.enums.AvailabilityStatus;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;

public class AvailabilityDTO implements Serializable {
    private Long id;
    private LocalDate day;
    private LocalTime startTime;
    private LocalTime endTime;
    private AvailabilityStatus status;
    private String doctorName;

    public AvailabilityDTO() {}

    // Getters & Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public LocalDate getDay() { return day; }
    public void setDay(LocalDate day) { this.day = day; }

    public LocalTime getStartTime() { return startTime; }
    public void setStartTime(LocalTime startTime) { this.startTime = startTime; }

    public LocalTime getEndTime() { return endTime; }
    public void setEndTime(LocalTime endTime) { this.endTime = endTime; }

    public AvailabilityStatus getStatus() { return status; }
    public void setStatus(AvailabilityStatus status) { this.status = status; }

    public String getDoctorName() { return doctorName; }
    public void setDoctorName(String doctorName) { this.doctorName = doctorName; }
}
