package action;

import data.pc;
import data.rec;
import other.dbOperator;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by yangwentao on 2016/1/17.
 */
public class recAction {
    public static List<rec> recList = new ArrayList();
    public static void refreshList(String beginTime,String endTime,String name) throws SQLException {
        recList.clear();
        String sql = "select * from rec";
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
        ResultSet rs = jdbc.doQuary(sql,new Object[]{});
        while (rs.next())
        {
            /*sql = "select name from province where id =?";
            ResultSet pRs = jdbc.doQuary(sql,new Object[]{rs.getString(3)});
            sql = "select name from city where id =?";
            ResultSet cRs = jdbc.doQuary(sql,new Object[]{rs.getString(4)});*/
            recList.add(new rec(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDouble(5),rs.getString(6)));
        }
        jdbc.deCon();
    }
    public static List<String> getRecer() throws SQLException {
        List<String> recEr = new ArrayList();
        String sql = "select distinct name from rec";
        dbOperator jdbc = new dbOperator();
        ResultSet rs = jdbc.doQuary(sql,new Object[]{});
        while (rs.next())
        {
            recEr.add(rs.getString(1));
        }
        jdbc.deCon();
        return recEr;
    }
    public static boolean addRec(String name,String pName,String cName,double count)
    {
        String sql = "INSERT INTO `rec`(`name`, `p_id`, `c_id`, `count`, `time`) VALUES (?,?,?,?,?)";
        String time = new SimpleDateFormat("yyyy-MM-dd") .format(new Date().getTime());
        dbOperator jdbc = new dbOperator();
        int rs = jdbc.doOthers(sql,new Object[]{name,pName,cName,count,time});
        if (rs > 0)
        {
            sql = "update sum set sum = sum + ?";
            jdbc.doOthers(sql,new Object[]{count});
        }
        return rs>0;
    }
    public static Map co = new TreeMap();
    public static void getProv(String beginTime,String endTime) throws SQLException {
        refreshList(beginTime,endTime,"");
        co.clear();
        for (rec r:recList)
        {
            if (!co.containsKey(r.getP_id()))
            {
                co.put(r.getP_id(),r.getCount());
            }
            else
            {
                double c = (double) co.get(r.getP_id());
                c += r.getCount();
                co.remove(r.getP_id());
                co.put(r.getP_id(),c);
            }
        }

    }
}
