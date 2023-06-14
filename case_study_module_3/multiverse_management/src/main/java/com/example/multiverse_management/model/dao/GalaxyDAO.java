package com.example.multiverse_management.model.dao;

import com.example.multiverse_management.connection.JdbcConnection;
import com.example.multiverse_management.model.entity.Galaxy;
import com.example.multiverse_management.model.entity.Multiverse;
import com.example.multiverse_management.model.exception.SQL_Exception;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GalaxyDAO implements IGalaxyDAO{
    private static final String INSERT_GALAXY_SQL = "INSERT INTO Galaxy (name, detail, image) VALUES (?, ?, ?)";
    private static final String SELECT_GALAXY_BY_ID = "SELECT name, detail, image FROM ,galaxy WHERE id = ? AND IS_DELETED = 0";
    private static final String SELECT_ALL_GALAXY = "select * from galaxy WHERE IS_DELETED = 0;";
    private static final String DELETE_GALAXY_SQL = "UPDATE galaxy SET IS_DELETED = ? where id = ?;";
    private static final String UPDATE_GALAXY_SQL = "update galaxy set name = ?, detail=?, img=?  where id = ?;";

    public GalaxyDAO() {
    }

    @Override
    public void insertGalaxy(Galaxy galaxy) throws SQLException {
        System.out.println(INSERT_GALAXY_SQL);
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_GALAXY_SQL)) {
            preparedStatement.setString(1, galaxy.getName());
            preparedStatement.setString(2, galaxy.getDetail());
            preparedStatement.setString(3, galaxy.getImg());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            SQL_Exception.printSQLException(e);
        }
    }

    @Override
    public Galaxy selectGalaxy(int id) {
        Galaxy galaxy = null;
        try (Connection connection = JdbcConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_GALAXY_BY_ID)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                String detail = rs.getString("detail");
                String img = rs.getString("img");
                galaxy = new Galaxy(id,name,detail,img);
            }
        } catch (SQLException e) {
            SQL_Exception.printSQLException(e);
        } return galaxy;
    }

    @Override
    public List<Galaxy> selectAllGalaxy() {
        List<Galaxy> galaxies = new ArrayList<>();
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_GALAXY);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String detail = rs.getString("detail");
                String img = rs.getString("img");
                galaxies.add(new Galaxy(id,name,detail,img));
            }
        } catch (SQLException e) {
            SQL_Exception.printSQLException(e);
        } return galaxies;
    }

    @Override
    public boolean deleteGalaxy(int id) throws SQLException {
        boolean rowDeleted = false;
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_GALAXY_SQL);) {
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
    public boolean updateGalaxy(Galaxy galaxy) throws SQLException {
        boolean rowUpdated = false;
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_GALAXY_SQL)) {
            preparedStatement.setString(1, galaxy.getName());
            preparedStatement.setString(2, galaxy.getDetail());
            preparedStatement.setString(3, galaxy.getImg());
            preparedStatement.setInt(4,galaxy.getId());
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
