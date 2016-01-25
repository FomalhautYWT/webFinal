package action;

import data.user;
import other.dbOperator;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.jar.Pack200;

/**
 * Created by yangwentao on 2016/1/16.
 */
public class userAction {
    public static List<user> userList = new ArrayList();
    public userAction()
    {
        refreshList();
    }
    public static void refreshList()
    {
        userList.clear();
        String sql = "select * from user";
        dbOperator jdbc = new dbOperator();
        ResultSet rs = jdbc.doQuary(sql,new Object[]{});
        try {
            while (rs.next())
            {
                    userList.add(new user(rs.getString("u_name"),rs.getString("u_id"),rs.getString("password"),rs.getInt("power")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            jdbc.deCon();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static boolean deleteUser(String u_id)
    {
        String sql = "delete from user where u_id=?";
        dbOperator jdbc = new dbOperator();
        int ret = jdbc.doOthers(sql,new Object[]{u_id});
        try {
            jdbc.deCon();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ret > 0;
    }
    public static boolean isExist(String u_id) throws SQLException {
        String sql = "select * from user where u_id=?";
        dbOperator jdbc = new dbOperator();
        ResultSet rs = jdbc.doQuary(sql,new Object[]{u_id});
        jdbc.deCon();
        try {
            if (rs.next())
                return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }
    public static boolean addUser(String u_name,String u_id,String password,int power) throws SQLException {
        String sql = "insert into user values(?,?,?,?)";
        dbOperator jdbc = new dbOperator();
        int ret = jdbc.doOthers(sql,new Object[]{u_name,u_id,password,power});
        jdbc.deCon();
        return ret > 0;
    }
    public static boolean updateUser(String u_id,String password)
    {
        dbOperator jdbc = new dbOperator();
        String sql = "update user set password=? where u_id=?";
        int rs = jdbc.doOthers(sql,new Object[]{password,u_id});
        return rs > 0;
    }
}
