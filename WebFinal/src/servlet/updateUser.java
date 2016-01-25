package servlet;

import action.userAction;
import other.MD5;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by yangwentao on 2016/1/16.
 */
public class updateUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        if (!req.getParameter("password").equals(req.getParameter("twice")))
        {
            session.setAttribute("info","两次密码不同");
            req.getRequestDispatcher("updateUser.jsp").forward(req,resp);
            System.out.println("nani");
        }
        else if (userAction.updateUser(req.getParameter("u_id"), MD5.md5(req.getParameter("password"))))
        {
            System.out.println("nani?");
            session.setAttribute("info","修改成功");
        }
        else
        {
            session.setAttribute("info","修改失败");
        }
        resp.sendRedirect("userMang.jsp");
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
