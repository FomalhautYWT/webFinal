package servlet;

import action.donAction;
import action.sumAction;

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
public class addDon extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
    public boolean isIdCard(String str) {
        if (str.length() != 15 && str.length() != 18) {
            return false;
        }
        for (int i = 0; i < str.length() - 1; i++){
            if (!Character.isDigit(str.charAt(i))){
                return  false;
            }
        }
        if (!Character.isDigit(str.charAt(str.length() - 1))
                && !str.substring(str.length() - 1).equals("x")
                && !str.substring(str.length() - 1).equals("X")) {
            return false;
        }
        return true;
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        if(req.getParameter("name") == null)
        {
            session.setAttribute("error","捐款人姓名不能为空");
            req.getRequestDispatcher("donMon.jsp").forward(req,resp);
        }
        else if(req.getParameter("idCard") == null)
        {
            session.setAttribute("error","身份证不能为空");
            req.getRequestDispatcher("donMon.jsp").forward(req,resp);
        }
        else if(!isIdCard(req.getParameter("idCard")))
        {
            session.setAttribute("error","身份证非法");
            req.getRequestDispatcher("donMon.jsp").forward(req,resp);
        }
        else if(req.getParameter("count") == null)
        {
            session.setAttribute("error","金额不能为空");
            req.getRequestDispatcher("donMon.jsp").forward(req,resp);
        }
        else
        try {
            sumAction.getSum();
            if (Double.parseDouble(req.getParameter("count")) > sumAction.num)
            {
                session.setAttribute("error","余额不足");
                req.getRequestDispatcher("donMon.jsp").forward(req,resp);

            }
            else if (donAction.addDon(req.getParameter("name"),req.getParameter("idCard"),Double.parseDouble(req.getParameter("count"))))
            {
                session.setAttribute("info","add successful");
                session.setAttribute("haveData",null);
                resp.sendRedirect("donList.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
