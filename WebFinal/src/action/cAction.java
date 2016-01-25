package action;

import other.dbOperator;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yangwentao on 2016/1/17.
 */
public class cAction {//city相关操作
    public static List<String> cList = new ArrayList();
    public static void refreshList(String p) throws SQLException {//更新

        dbOperator jdbc = new dbOperator();
        cList.clear();
        String sql = "select name from city where p_id = ?";
        ResultSet rs ;
        if (p.equals("")) {
            sql = "select name from city";
            rs = jdbc.doQuary(sql, new Object[]{});
        }
        else
        {
            rs = jdbc.doQuary(sql,new Object[]{p});
        }
        while (rs.next())
        {
            cList.add(rs.getString(1));
        }
        jdbc.deCon();
    }
    public static String id2name(String id) throws SQLException {
        String sql = "select name from city where id=?";
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
