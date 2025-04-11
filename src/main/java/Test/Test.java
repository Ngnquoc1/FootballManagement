package Test;

import Controller.Connection.DatabaseConnection;

import java.sql.Connection;
import java.sql.SQLException;

public class Test {
    public static void main(String args[]) {
        try {
            DatabaseConnection db = DatabaseConnection.getInstance();
            Connection conn = db.getConnectionn();

            db.disconnect();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
