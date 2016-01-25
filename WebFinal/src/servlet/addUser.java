package servlet;

import action.userAction;
import other.MD5;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by yangwentao on 2016/1/16.
 */
public class addUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        userAction.refreshList();
        if (!req.getParameter("password").equals(req.getParameter("twice")))
        {
            session.setAttribute("info","两次密码输入不同");
            req.getRequestDispatcher("addUser.jsp").forward(req,resp);
        }
        else try {
            if (userAction.isExist(req.getParameter("u_id")))
            {
                session.setAttribute("info","ID已存在");
                req.getRequestDispatcher("addUser.jsp").forward(req,resp);
            }
            else try {
                if (userAction.addUser(req.getParameter("u_id"),req.getParameter("u_name"), MD5.md5(req.getParameter("twice")),Integer.parseInt( req.getParameter("power"))))
                {
                    session.setAttribute("info","添加用户成功");
                    resp.sendRedirect("userMang.jsp");
                }
                else
                {
                    session.setAttribute("info","添加失败，请联系管理员");
                    resp.sendRedirect("userMang.jsp");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
