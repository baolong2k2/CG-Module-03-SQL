package com.codegym.dao;

import com.codegym.connection.JdbcConnection;
import com.codegym.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

public class UserDao {
    private List<User> users = null;

    public List<User> getAll() {
        users = new LinkedList<>();

        try {
            Connection connection = JdbcConnection.getConnection();
            String query = "SELECT u.id, u.fullname, u.username, " +
                    "u.password, u.email, u.address " +
                    "FROM user u ;";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getLong("id"));
                user.setFullName(resultSet.getString("fullname"));
                user.setUserName(resultSet.getString("username"));
                user.setPassWord(resultSet.getString("password"));
                user.setEmail(resultSet.getString("email"));
                user.setAddress(resultSet.getString("address"));
                users.add(user);
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }
}
