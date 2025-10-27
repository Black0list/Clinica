package com.clinica.Service;

import com.clinica.dto.AppointmentDTO;
import com.clinica.model.Appointment;
import com.clinica.model.enums.AppointmentStatus;
import com.clinica.model.enums.AppointmentType;
import com.clinica.repository.AppointmentRepository;
import com.clinica.service.AppointmentService;
import org.junit.jupiter.api.*;
import org.mockito.MockedStatic;
import org.mockito.Mockito;

import java.time.LocalDate;
import java.time.LocalTime;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

public class AppointmentServiceTest {

    private static MockedStatic<AppointmentRepository> mockedStatic;

    @BeforeAll
    static void beforeAll() {
        mockedStatic = Mockito.mockStatic(AppointmentRepository.class);
    }

    @AfterAll
    static void afterAll() {
        mockedStatic.close();
    }

    @Test
    void testCreateAppointment() {

        AppointmentRepository mockRepo = mock(AppointmentRepository.class);
        mockedStatic.when(AppointmentRepository::getInstance).thenReturn(mockRepo);


        AppointmentDTO dto = new AppointmentDTO();
        dto.setDate(LocalDate.now());
        dto.setStartTime(LocalTime.of(10, 0));
        dto.setEndTime(LocalTime.of(10, 30));
        dto.setStatus(AppointmentStatus.PLANNED.name());
        dto.setType(AppointmentType.ONLINE.name());
        dto.setExecutor("System");
        dto.setDoctorName("Katell Mathews");
        dto.setPatientName("Sheila Stafford");



        when(mockRepo.create(any(Appointment.class))).thenReturn(true);

        boolean result = AppointmentService.getInstance().createAppointment(dto);

        assertTrue(result, "Appointment should be created successfully");
        verify(mockRepo, times(1)).create(any(Appointment.class));
    }
}
