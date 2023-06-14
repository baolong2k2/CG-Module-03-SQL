package com.example.multiverse_management.model.dao;

import com.example.multiverse_management.connection.JdbcConnection;
import com.example.multiverse_management.model.entity.Multiverse;
import com.example.multiverse_management.model.exception.SQL_Exception;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MultiverseDAO implements IMultiverseDAO{
    private static final String INSERT_MULTIVERSE_SQL = "INSERT INTO Multiverse (name, detail, image) VALUES (?, ?, ?)";
    private static final String SELECT_MULTIVERSE_BY_ID = "SELECT name, detail, image FROM ,multiverse WHERE id = ? AND IS_DELETED = 0";
    private static final String SELECT_ALL_MULTIVERSE = "select * from multiverse WHERE IS_DELETED = 0;";
    private static final String DELETE_MULTIVERSE_SQL = "UPDATE multiverse SET IS_DELETED = ? where id = ?;";
    private static final String UPDATE_MULTIVERSE_SQL = "update multiverse set name = ?, detail=?, img=?  where id = ?;";

    public MultiverseDAO() {
    }

    @Override
    public void insertMultiverse(Multiverse multiverse) throws SQLException {
        System.out.println(INSERT_MULTIVERSE_SQL);
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_MULTIVERSE_SQL)) {
            preparedStatement.setString(1, multiverse.getName());
            preparedStatement.setString(2, multiverse.getDetail());
            preparedStatement.setString(3, multiverse.getImg());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            SQL_Exception.printSQLException(e);
        }
    }

    @Override
    public Multiverse selectMultiverse(int id) {
        Multiverse multiverse = null;
        try (Connection connection = JdbcConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MULTIVERSE_BY_ID)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                String detail = rs.getString("detail");
                String img = rs.getString("img");
                multiverse = new Multiverse(id,name,detail,img);
            }
        } catch (SQLException e) {
            SQL_Exception.printSQLException(e);
        } return multiverse;
    }

    @Override
    public List<Multiverse> selectAllMultiverse() {
        List<Multiverse> multiverses = new ArrayList<>();
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_MULTIVERSE);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String detail = rs.getString("detail");
                String img = rs.getString("img");
                multiverses.add(new Multiverse(id,name,detail,img));
            }
        } catch (SQLException e) {
            SQL_Exception.printSQLException(e);
        } return multiverses;
    }

    @Override
    public boolean deleteMultiverse(int id) throws SQLException {
        boolean rowDeleted = false;
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_MULTIVERSE_SQL);) {
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
    public boolean updateMultiverse(Multiverse multiverse) throws SQLException {
        boolean rowUpdated = false;
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_MULTIVERSE_SQL)) {
            preparedStatement.setString(1, multiverse.getName());
            preparedStatement.setString(2, multiverse.getDetail());
            preparedStatement.setString(3, multiverse.getImg());
            preparedStatement.setInt(4,multiverse.getId());
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
