package com.example.multiverse_management.model.service;

import com.example.multiverse_management.model.dao.MultiverseDAO;
import com.example.multiverse_management.model.entity.Multiverse;

import java.sql.SQLException;
import java.util.List;

public class MultiverseService {
    private static final MultiverseService MULTIVERSE_SERVICE = new MultiverseService();
    private MultiverseService(){}
    public static MultiverseService getInstance() {
        return MULTIVERSE_SERVICE;
    }
    private MultiverseDAO multiverseDAO = new MultiverseDAO();
    public List<Multiverse> getAllMultiverse() {
        return multiverseDAO.selectAllMultiverse();
    }
    public Multiverse getDetailMultiverse(int id) {
        return multiverseDAO.selectMultiverse(id);
    }
    public boolean deleteMultiverse(int id) throws SQLException {
        return multiverseDAO.deleteMultiverse(id);
    }
    public void insertMultiverse(Multiverse multiverse) throws SQLException {
        multiverseDAO.insertMultiverse(multiverse);
    }
    public boolean updateMultiverse(Multiverse multiverse) throws SQLException {
        return multiverseDAO.updateMultiverse(multiverse);
    }
}
