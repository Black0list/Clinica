package com.clinica.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "DoctorServlet", value = { "/doctors/*", "/doctors" })
public class DoctorServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/pages/doctors.jsp")
                .forward(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String path = req.getPathInfo();

        switch (path){
            case "create" -> handleCreate(req, res);
            case "update" -> handleUpdate(req, res);
        }
    }

    private void handleCreate(HttpServletRequest req, HttpServletResponse res) {

    }


    private void handleUpdate(HttpServletRequest req, HttpServletResponse res) {
    }

}
