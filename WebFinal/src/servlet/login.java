package servlet;

import other.MD5;
import other.conDB;
import other.dbOperator;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by yangwentao on 2016/1/15.
 */

public class login extends HttpServlet {

    private String sql = "select * from user where u_id=?";
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        dbOperator jdbc = new dbOperator();
        ResultSet rs = jdbc.doQuary(sql,new Object[]{req.getParameter("u_id")});
        try {
            if (!rs.next())
            {
                session.setAttribute("error","wrong u_id");
                resp.sendRedirect("login.jsp");

            }
            else
            {
                if (!MD5.md5(req.getParameter("pwd")).equals(rs.getString(3)))
                {
                    session.setAttribute("error","wrong pwd");
                    resp.sendRedirect("login.jsp");
                }
                else
                {
                    session.setAttribute("u_name",rs.getString(1));
                    session.setAttribute("u_id",rs.getString(2));
                    session.setAttribute("power",rs.getString(4));
                    System.out.println(rs.getString(4));
                    resp.sendRedirect("redTenDo.jsp");
//                    resp.sendRedirect("user.jsp");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
