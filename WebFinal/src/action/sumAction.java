package action;

import other.dbOperator;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by yangwentao on 2016/1/17.
 */
public class sumAction {
    public static double num = 0;
    public static double getSum() throws SQLException {

        dbOperator jdbc = new dbOperator();
        String sql = "select sum from sum";
        ResultSet rs = jdbc.doQuary(sql,new Object[]{});
        //jdbc.deCon();
        if (rs.next())
        {
            return Double.parseDouble(rs.getString(1));
        }
        return -1;
    }
}
