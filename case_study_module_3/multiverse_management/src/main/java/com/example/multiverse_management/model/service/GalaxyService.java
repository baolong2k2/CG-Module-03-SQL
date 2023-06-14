package com.example.multiverse_management.model.service;

import com.example.multiverse_management.model.dao.GalaxyDAO;
import com.example.multiverse_management.model.entity.Galaxy;


import java.sql.SQLException;
import java.util.List;

public class GalaxyService {
    private static final GalaxyService GALAXY_SERVICE = new GalaxyService();
    private GalaxyService(){}
    public static GalaxyService getInstance() {
        return GALAXY_SERVICE;
    }
    private GalaxyDAO galaxyDAO = new GalaxyDAO();
    public List<Galaxy> getAllGalaxy() {
        return galaxyDAO.selectAllGalaxy();
    }
    public Galaxy getDetailGalaxy(int id) {
        return galaxyDAO.selectGalaxy(id);
    }
    public boolean deleteGalaxy(int id) throws SQLException {
        return galaxyDAO.deleteGalaxy(id);
    }
    public void insertGalaxy(Galaxy galaxy) throws SQLException {
        galaxyDAO.insertGalaxy(galaxy);
    }
    public boolean updateGalaxy(Galaxy galaxy) throws SQLException {
        return galaxyDAO.updateGalaxy(galaxy);
    }
}
