package com.example.multiverse_management.model.dao;

import com.example.multiverse_management.model.entity.Multiverse;

import java.sql.SQLException;
import java.util.List;

public interface IMultiverseDAO {
    void insertMultiverse(Multiverse multiverse) throws SQLException;
    Multiverse selectMultiverse(int id);
    List<Multiverse> selectAllMultiverse();
    boolean deleteMultiverse (int id) throws SQLException;
    boolean updateMultiverse (Multiverse multiverse) throws SQLException;

}
