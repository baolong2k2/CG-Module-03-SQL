package com.example.multiverse_management.model.service;

import com.example.multiverse_management.model.dao.PlanetDAO;
import com.example.multiverse_management.model.entity.Planet;

import java.sql.SQLException;
import java.util.List;

public class PlanetService {
    private static final PlanetService PLANET_SERVICE = new PlanetService();
    private PlanetService(){};
    public static PlanetService getInstance(){
        return PLANET_SERVICE;
    }
    private PlanetDAO planetDAO = new PlanetDAO();
    public List<Planet> getAllPlanet(){
        return planetDAO.selectAllPlanet();
    }
    public Planet getDetailPlanet (int id){
        return planetDAO.selectPlanet(id);
    }
    public boolean deletePlanet(int id) throws SQLException {
        return planetDAO.deletePlanet(id);
    }
    public void insertPlanet(Planet planet) throws SQLException {
        planetDAO.insertPlanet(planet);
    }
    public boolean updatePlanet(Planet planet) throws SQLException {
        return planetDAO.updatePlanet(planet);
    }
}
