package com.example.multiverse_management.model.dao;

import com.example.multiverse_management.model.entity.Galaxy;
import com.example.multiverse_management.model.entity.Multiverse;

import java.sql.SQLException;
import java.util.List;

public interface IGalaxyDAO {
    void insertGalaxy(Galaxy galaxy) throws SQLException;
    Galaxy selectGalaxy(int id);
    List<Galaxy> selectAllGalaxy();
    boolean deleteGalaxy (int id) throws SQLException;
    boolean updateGalaxy (Galaxy galaxy) throws SQLException;
}
