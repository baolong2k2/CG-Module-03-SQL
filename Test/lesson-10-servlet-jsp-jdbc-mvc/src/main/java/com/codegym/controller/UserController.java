package com.codegym.controller;

import com.codegym.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "userServlet", value = "/")
public class UserController extends HttpServlet {

    private UserService userService = null;

    public UserController() {
        userService = new UserService();
    }

//    @Override
//    public void init() throws ServletException {
//        userService = new UserService();
//    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("users", userService.findAll());
        req.getRequestDispatcher("/WEB-INF/view/user/index.jsp").forward(req, resp);
    }
}
