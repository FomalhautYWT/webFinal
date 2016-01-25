package action;

import other.dbOperator;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yangwentao on 2016/1/17.
 */
public class pAction {
    public static List<String> pList = new ArrayList();
    public static void refreshList() throws SQLException {
        dbOperator jdbc = new dbOperator();
        pList.clear();
        String sql = "select name from province";
        ResultSet rs = jdbc.doQuary(sql,new Object[]{});
        while (rs.next())
        {
            pList.add(rs.getString(1));
        }
        jdbc.deCon();
    }
    public static String id2name(String id) throws SQLException {
        String sql = "select name from province where id=?";
        dbOperator jdbc = new dbOperator();
        ResultSet rs = jdbc.doQuary(sql,new Object[]{id});
        String name = "";
        while (rs.next())
        {
            name = rs.getString(1);
        }
        return name;
    }
}
