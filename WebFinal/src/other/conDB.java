package other;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by yangwentao on 2016/1/15.
 */
public class conDB {
    private String userName = "root";
    private String passWord = "";
    private Connection con;
    public conDB()
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    public Connection getConnection()
    {
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webfinal?useUnicode=true&characterEncoding=UTF-8",this.userName,this.passWord);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }
}
