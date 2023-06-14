package com.example.multiverse_management.model.service;

import com.example.multiverse_management.model.dao.UserDAO;

public class AuthService {
    private UserDAO userDAO = null;

    public AuthService() {
        userDAO = new UserDAO();
    }
}
