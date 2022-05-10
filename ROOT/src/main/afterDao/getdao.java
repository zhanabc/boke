package afterDao;

import Dao.connectiondatabaes;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class getdao {
    public static String getcontext(int id,String title) throws SQLException {
        String sql="SELECT context FROM publish WHERE pid='"+id+"'and title='"+title+"'";
        Connection connection = connectiondatabaes.connection_database();
        ResultSet resultSet = connectiondatabaes.executeSQL(connection, sql);
        String context = "";
        while (resultSet.next()){
            context=resultSet.getString("context");
        }
        return context;
    }
}
