package com.example.multiverse_management.model.dao;

import com.example.multiverse_management.connection.JdbcConnection;
import com.example.multiverse_management.model.entity.Scientist;
import com.example.multiverse_management.model.entity.User;
import com.example.multiverse_management.model.exception.SQL_Exception;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ScientistDAO implements IScientistDAO{
    private static final String INSERT_SCIENTIST_SQL = "INSERT INTO scientist (user_name,full_name,phone_number,email,password,address,avatar) VALUES (?,?,?,?,?,?,?)";
    private static final String SELECT_SCIENTIST_BY_ID = "SELECT user_name,full_name,phone_number,email,password,address,avatar FROM scientist WHERE id =? AND IS_DELETED = 0";
    private static final String SELECT_ALL_SCIENTIST = "select * from scientist WHERE IS_DELETED = 0;";
    private static final String DELETE_SCIENTIST_SQL = "UPDATE scientist SET IS_DELETED = ? where id = ?;";
    private static final String UPDATE_SCIENTIST_SQL = "update scientist set user_name = ?,full_name= ?, phone_number =?, email=?, password=?, address=?, avatar=?  where id = ?;";
    public ScientistDAO(){}
    @Override
    public User get(int id) {
        User user = null;
        try (Connection connection = JdbcConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SCIENTIST_BY_ID)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String user_name = rs.getString("user_name");
                String full_name = rs.getString("full_name");
                String phone_number = rs.getString("phone_number");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String address = rs.getString("address");
                String avatar = rs.getString("avatar");
                user = new Scientist(user_name,full_name,phone_number,email,password,address,avatar);
            }
        } catch (SQLException e) {
            SQL_Exception.printSQLException(e);
        } return user;
    }

    @Override
    public void insertScientist(User user) throws SQLException {
        System.out.println(INSERT_SCIENTIST_SQL);
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SCIENTIST_SQL)) {
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getFullName());
            preparedStatement.setString(3, user.getPhoneNumber());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setString(5, user.getPassWord());
            preparedStatement.setString(6, user.getAddress());
            preparedStatement.setString(7, user.getAvatar());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            SQL_Exception.printSQLException(e);
        }
    }

    @Override
    public List<User> selectAllScientist() {
        List<User> users = new ArrayList<>();
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SCIENTIST);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String user_name = rs.getString("user_name");
                String full_name = rs.getString("full_name");
                String phone_number = rs.getString("phone_number");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String address = rs.getString("address");
                String avatar = rs.getString("avatar");
                users.add(new Scientist(id,user_name,full_name,phone_number,email,password,address,avatar));
            }
        } catch (SQLException e) {
            SQL_Exception.printSQLException(e);
        } return users;
    }

    @Override
    public boolean deleteScientist(int id) throws SQLException {
        boolean rowDeleted = false;
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_SCIENTIST_SQL);) {
            statement.setInt(1,1);
            statement.setInt(2,id);
            if(statement.executeUpdate() > 0) {
                System.out.println("Removed user successfully.");
                rowDeleted = true;
            } else {
                System.out.println("Failed to remove user.");
            }
        } catch (SQLException e) {
            SQL_Exception.printSQLException(e);
        }
        return rowDeleted;
    }

    @Override
    public boolean updateScientist(User user) throws SQLException {
        boolean rowUpdated = false;
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_SCIENTIST_SQL)) {
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getFullName());
            preparedStatement.setString(3, user.getPhoneNumber());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setString(5, user.getPassWord());
            preparedStatement.setString(6, user.getAddress());
            preparedStatement.setString(7, user.getAvatar());
            preparedStatement.setInt(8,user.getID());
            if(preparedStatement.executeUpdate() > 0) {
                System.out.println("Edited user successfully.");
                rowUpdated = true;
            } else {
                System.out.println("Failed to edit user.");
            }
        } catch (SQLException e) {
            SQL_Exception.printSQLException(e);
        }
        return rowUpdated;
    }
}
