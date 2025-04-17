package org.example.DAO;

import org.example.model.Provinces;
import org.example.util.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProvinceDAOImpl implements ProvinceDAO {
    @Override
    public List<Provinces> getAllProvinces() {
        DatabaseConnection databaseConnection = new DatabaseConnection();

        List<Provinces> provinces = new ArrayList<>();
        String query = "SELECT * FROM provinces";

        try (Connection conn = databaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Provinces province = new Provinces();
                province.setIdProvince(rs.getInt("idProvince"));
                province.setNameProvince(rs.getString("nameProvince"));
                province.setNote(rs.getString("note"));

                provinces.add(province);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return provinces;
    }
}
