package action;

import data.donation;
import other.dbOperator;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by yangwentao on 2016/1/17.
 */
public class donAction {
    public static List<donation> donList = new ArrayList();
    public static void refreshList(String beginTime , String endTime , String name) throws SQLException {
        donList.clear();
        String sql = "select * from donation";
        int p = 0;
        if (beginTime != "")
        {
            p = 1;
            sql = sql + " where time >= '"+beginTime+"'";
        }
        if (endTime != "")
        {
            if (p == 1)
            {
                sql += " and time <= '"+endTime+"'";
            }
            else {
                sql += " where time <= '"+endTime+"'";
                p = 1;
            }
        }
        if (name != "")
        {
            if (p == 1)
            {
                sql += " and name = '"+name+"'";
            }
            else
            {
                sql += " where name = '"+name+"'";
            }
        }
        dbOperator jdbc = new dbOperator();
        System.out.println("donAction"+sql);
        ResultSet rs = jdbc.doQuary(sql,new Object[]{});
        while (rs.next())
        {
            donList.add(new donation(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getDouble(4),rs.getString(5)));
        }
        jdbc.deCon();

    }
    public static List<String> getDoner() throws SQLException {//得到所有的捐赠者
        List<String> donEr = new ArrayList();
        String sql = "select distinct name from donation";
        dbOperator jdbc = new dbOperator();
        ResultSet rs = jdbc.doQuary(sql,new Object[]{});
        while (rs.next())
        {
            donEr.add(rs.getString(1));
        }
        jdbc.deCon();
        return donEr;
    }
    public static boolean addDon(String name ,String idCard , double count) throws SQLException {

        String sql = "insert into donation (name, idCard, count, time) value (?, ?, ?, ?)";
        String time = new SimpleDateFormat("yyyy-MM-dd").format(new Date().getTime());
        dbOperator jdbc = new dbOperator();
        int rs = jdbc.doOthers(sql,new Object[]{name,idCard,count,time});
        if (rs > 0)
        {
            sql = "update sum set sum = sum - ?";
            jdbc.doOthers(sql,new Object[]{count});
        }
        jdbc.deCon();
        return rs > 0;
    }
}
