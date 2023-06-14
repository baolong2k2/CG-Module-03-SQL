package com.example.multiverse_management.model.dao;

import com.example.multiverse_management.model.entity.Galaxy;
import com.example.multiverse_management.model.entity.Planet;

import java.sql.SQLException;
import java.util.List;

public interface IPlanetDAO {
    void insertPlanet(Planet planet) throws SQLException;
    Planet selectPlanet(int id);
    List<Planet> selectAllPlanet();
    boolean deletePlanet (int id) throws SQLException;
    boolean updatePlanet (Planet planet) throws SQLException;
}
