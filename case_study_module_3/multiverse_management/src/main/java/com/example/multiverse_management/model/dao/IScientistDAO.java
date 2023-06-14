package com.example.multiverse_management.model.dao;

import com.example.multiverse_management.model.entity.User;

import java.sql.SQLException;
import java.util.List;

public interface IScientistDAO {
    User get(int id);
    void insertScientist(User user) throws SQLException;
    List<User> selectAllScientist();
    boolean deleteScientist(int id) throws SQLException;
    boolean updateScientist(User user) throws SQLException;
}
