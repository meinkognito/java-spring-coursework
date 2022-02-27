package coursework;

import coursework.utils.JDBCUtils;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Main {

  public static void main(String[] args) {
    String dbURL = "jdbc:postgresql://localhost:5432/coursework";

    try (Connection connection = DriverManager.getConnection(dbURL)) {
      JDBCUtils.printBooksList(connection);
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
}
