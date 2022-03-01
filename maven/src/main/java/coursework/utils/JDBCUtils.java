package coursework.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCUtils {

  public static void printBooksList(Connection connection) {
    String sql = "select * from BOOKS";
    try (PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet rs = statement.executeQuery()) {
      while (rs.next()) {
        String book = rs.getString("name");
        int count = rs.getInt(3);
        System.out.println("\"" + book + "\" is available in " + count + " copies");
      }
    } catch (SQLException throwables) {
      throwables.printStackTrace();
    }
  }
}
