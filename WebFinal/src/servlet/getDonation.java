package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by yangwentao on 2016/1/17.
 */

public class getDonation extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("123");
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        if (req.getParameter("getBeginTime")!=null)
        {
            session.setAttribute("beginTime",req.getParameter("getBeginTime"));
        }
        else
        {
            session.setAttribute("beginTime","");
        }
        if (req.getParameter("getEndTime")!=null)
        {
            session.setAttribute("endTime",req.getParameter("getEndTime"));
        }
        else
        {
            session.setAttribute("endTime","");
        }
        if (req.getParameter("getName")!=null)
        {
            session.setAttribute("name",req.getParameter("getName"));
        }
        else
        {
            session.setAttribute("name","");
        }
        session.setAttribute("haveData",1);
        req.getRequestDispatcher("donList.jsp").forward(req,resp);
    }
}
