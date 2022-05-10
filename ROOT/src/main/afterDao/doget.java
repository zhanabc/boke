package afterDao;

import Dao.connectiondatabaes;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class doget {
    public static ArrayList<Integer> getName() throws SQLException {
        String sql = "SELECT pid FROM publish";
        ArrayList<Integer> contexts = new ArrayList();
        Connection connection = connectiondatabaes.connection_database();
        ResultSet resultSet = connectiondatabaes.executeSQL(connection, sql);

        while(resultSet.next()) {
            int pid = resultSet.getInt("pid");
            contexts.add(pid);
        }

        return contexts;
    }
}
