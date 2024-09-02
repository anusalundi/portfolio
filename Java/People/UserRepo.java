package com.datorium.Datorium.API.Repo;

import com.datorium.Datorium.API.DTOs.User;
import java.sql.DriverManager;
import java.sql.SQLException;

public class UserRepo {

    public int add(User user) {
        String url = "jdbc:sqlite:my.db";
        try (var conn = DriverManager.getConnection(url)) {
            if (conn != null) {
                var statement = conn.createStatement();
                statement.execute("INSERT INTO people (name) VALUES ('" + user.name + "')");
                return 0;
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return 1;
    }
}
