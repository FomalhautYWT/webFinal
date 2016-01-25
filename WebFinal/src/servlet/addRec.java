package servlet;

import action.cAction;
import action.pAction;
import action.recAction;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by yangwentao on 2016/1/17.
 */
public class addRec extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        if (recAction.addRec(req.getParameter("name"), req.getParameter("pName"), req.getParameter("cName"),Double.parseDouble(req.getParameter("count"))))
        {
            session.setAttribute("info","add successful");
            resp.sendRedirect("recList.jsp");
        }
    }
}
