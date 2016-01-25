package other;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by yangwentao on 2016/1/15.
 */
public class dbOperator {
    private conDB jdbc = new conDB();
    private Connection con = jdbc.getConnection();
    private ResultSet rs;
    private PreparedStatement pstm;
    public void deCon() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (con != null)
        {
            con.close();
        }
    }
    public ResultSet doQuary(final String sql , final Object[] para)
    {
        try {
            pstm = con.prepareStatement(sql);
            for (int i = 0 ; i < para.length ; i ++)
            {
                pstm.setObject(i + 1 , para[i]);
            }
            System.out.println(pstm.toString());
            return pstm.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    public int doOthers(final String sql , final Object[] para)
    {
        try {
            pstm = con.prepareStatement(sql);
            for (int i = 0 ; i < para.length ; i ++)
            {
                pstm.setObject(i + 1 , para[i]);
            }
            return pstm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }
}
