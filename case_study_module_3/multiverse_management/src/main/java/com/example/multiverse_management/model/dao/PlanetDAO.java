package com.example.multiverse_management.model.dao;

import com.example.multiverse_management.connection.JdbcConnection;
import com.example.multiverse_management.model.entity.Galaxy;
import com.example.multiverse_management.model.entity.Planet;
import com.example.multiverse_management.model.exception.SQL_Exception;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PlanetDAO implements IPlanetDAO{
    private static final String INSERT_PLANET_SQL = "INSERT INTO Planet (name, detail, typeOfCreature,environment, civilization, image) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SELECT_PLANET_BY_ID = "SELECT name, detail, typeOfCreature, environment, civilization, image FROM ,planet WHERE id = ? AND IS_DELETED = 0";
    private static final String SELECT_ALL_PLANET = "select * from planet WHERE IS_DELETED = 0;";
    private static final String DELETE_PLANET_SQL = "UPDATE planet SET IS_DELETED = ? where id = ?;";
    private static final String UPDATE_PLANET_SQL = "update planet set name = ?, detail=?, typeOfCreature=?, environment=?, civilization=?,img=?  where id = ?;";


    @Override
    public void insertPlanet(Planet planet) throws SQLException {
        System.out.println(INSERT_PLANET_SQL);
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PLANET_SQL)) {
            preparedStatement.setString(1, planet.getName());
            preparedStatement.setString(2, planet.getDetail());
            preparedStatement.setString(3, planet.getTypeOfCreature());
            preparedStatement.setString(4, planet.getEnvironment());
            preparedStatement.setString(5, planet.getCivilization());
            preparedStatement.setString(6, planet.getImg());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            SQL_Exception.printSQLException(e);
        }
    }

    @Override
    public Planet selectPlanet(int id) {
        Planet planet = null;
        try (Connection connection = JdbcConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PLANET_BY_ID)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                String detail = rs.getString("detail");
                String typeOfCreature = rs.getString("typeOfCreature");
                String environment = rs.getString("environment");
                String civilization = rs.getString("civilization");
                String img = rs.getString("img");
                planet = new Planet(id,name,detail,typeOfCreature, environment,civilization,img);
            }
        } catch (SQLException e) {
            SQL_Exception.printSQLException(e);
        } return planet;
    }

    @Override
    public List<Planet> selectAllPlanet() {
        List<Planet> planets = new ArrayList<>();
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PLANET);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String detail = rs.getString("detail");
                String typeOfCreature = rs.getString("typeOfCreature");
                String environment = rs.getString("environment");
                String civilization = rs.getString("civilization");
                String img = rs.getString("img");
                planets.add(new Planet(id,name,detail,typeOfCreature, environment,civilization,img));
            }
        } catch (SQLException e) {
            SQL_Exception.printSQLException(e);
        } return planets;
    }

    @Override
    public boolean deletePlanet(int id) throws SQLException {
        boolean rowDeleted = false;
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_PLANET_SQL);) {
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
    public boolean updatePlanet(Planet planet) throws SQLException {
        boolean rowUpdated = false;
        try (Connection connection = JdbcConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PLANET_SQL)) {
            preparedStatement.setString(1, planet.getName());
            preparedStatement.setString(2, planet.getDetail());
            preparedStatement.setString(3, planet.getTypeOfCreature());
            preparedStatement.setString(4, planet.getEnvironment());
            preparedStatement.setString(5, planet.getCivilization());
            preparedStatement.setString(6, planet.getImg());
            preparedStatement.setInt(7, planet.getId());
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
