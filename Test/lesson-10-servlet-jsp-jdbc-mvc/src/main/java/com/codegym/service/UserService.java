package com.codegym.service;

import com.codegym.dao.UserDao;
import com.codegym.model.User;
import jdk.internal.foreign.abi.aarch64.linux.LinuxAArch64Linker;

import java.util.List;
import java.util.Optional;

public class UserService {

    private UserDao userDao = null;

    public UserService() {
        userDao = new UserDao();
    }

    public List<User> findAll() {
        return userDao.getAll();
    }
}
